import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:realm/realm.dart';
import 'package:todo_bloc/src/core/constants/theme.dart';
import 'package:todo_bloc/src/data/api/queue/local_queue_api.dart';
import 'package:todo_bloc/src/data/api/queue/remote_queue_api.dart';
import 'package:todo_bloc/src/data/api/queue_service.dart';
import 'package:todo_bloc/src/data/api/todo/local_todo_api.dart';
import 'package:todo_bloc/src/data/api/todo/remote_todo_api.dart';
import 'package:todo_bloc/src/data/api/user_api.dart';
import 'package:todo_bloc/src/data/local_storage/local_storage.dart';
import 'package:todo_bloc/src/data/local_storage/local_storage_impl.dart';
import 'package:todo_bloc/src/data/models/dtos/user/user_dto.dart';
import 'package:todo_bloc/src/data/repositories/auth/auth_repository.dart';
import 'package:todo_bloc/src/data/repositories/auth/auth_repository_impl.dart';
import 'package:todo_bloc/src/data/repositories/connection_checker/connection_checker.dart';
import 'package:todo_bloc/src/data/repositories/connection_checker/connection_checker_impl.dart';
import 'package:todo_bloc/src/data/repositories/settings/settings_repository.dart';
import 'package:todo_bloc/src/data/repositories/settings/settings_repository_impl.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository_impl.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository_impl.dart';
import 'package:todo_bloc/src/l10n/l10n.dart';
import 'package:todo_bloc/src/modules/connection_checker/bloc/connection_checker_bloc.dart';
import 'package:todo_bloc/src/modules/landing_loading/view/landing_loading_view.dart';
import 'package:todo_bloc/src/modules/settings/cubit/settings_cubit.dart';
import 'package:todo_bloc/src/modules/todo_sync/cubit/todo_sync_cubit.dart';

class App extends StatelessWidget {
  const App({
    required Realm realm,
    required InternetConnection internetConnection,
    super.key,
  })  : _realm = realm,
        _internetConnection = internetConnection;

  final Realm _realm;
  final InternetConnection _internetConnection;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocalStorage>(
          lazy: false,
          create: (context) => LocalStorageImpl(realm: _realm),
        ),
        RepositoryProvider<ConnectionChecker>(
          create: (context) =>
              ConnectionCheckerImpl(internetConnection: _internetConnection),
        ),
        RepositoryProvider<SettingsRepository>(
          create: (context) => SettingsRepositoryImpl(),
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            firebaseAuth: FirebaseAuth.instance,
            googleSignIn: GoogleSignIn(),
            userApi: UserApi(localStorage: context.read<LocalStorage>()),
          ),
        ),
        RepositoryProvider<TodoRepository>(
          create: (context) => TodoRepositoryImpl(
            todoApi: LocalTodoApi(
              localStorage: context.read<LocalStorage>(),
            ),
          ),
        ),
        RepositoryProvider<TodoSyncRepository>(
          create: (context) => TodoSyncRepositoryImpl(
            queueService: QueueService(
              localQueueApi: LocalQueueApi(
                localStorage: context.read<LocalStorage>(),
              ),
              remoteQueueApi: RemoteQueueApi(
                firestore: FirebaseFirestore.instance,
                userId:
                    context.read<LocalStorage>().readAll<UserDTO>().first.uid,
              ),
              localTodoApi: LocalTodoApi(
                localStorage: context.read<LocalStorage>(),
              ),
              remoteTodoApi: RemoteTodoApi(
                firestore: FirebaseFirestore.instance,
                userId:
                    context.read<LocalStorage>().readAll<UserDTO>().first.uid,
              ),
            ),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SettingsCubit(),
          ),
          BlocProvider(
            create: (context) => ConnectionCheckerBloc(
              connectionChecker: context.read<ConnectionChecker>(),
              todoRepository: context.read<TodoRepository>(),
            )..add(const ConnectionCheckerInitializationRequested()),
          ),
          BlocProvider(
            create: (context) => TodoSyncCubit(
              todoSyncRepository: context.read<TodoSyncRepository>(),
            ),
          ),
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: TodoBlocAppTheme.lightTheme,
              darkTheme: TodoBlocAppTheme.darkTheme,
              // TODO(demolaf): change to use system
              // themeMode: ThemeMode.system,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const LandingLoadingView(),
            );
          },
        ),
      ),
    );
  }
}
