import 'package:apis/apis.dart';
import 'package:bloc_implementation/src/features/connection_checker/bloc/connection_checker_bloc.dart';
import 'package:bloc_implementation/src/features/landing_loading/view/landing_loading_view.dart';
import 'package:bloc_implementation/src/features/todo_sync/cubit/todo_sync_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:realm/realm.dart';
import 'package:repositories/repositories.dart';

class BlocApp extends StatelessWidget {
  const BlocApp({
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
            localQueueApi: LocalQueueApi(
              localStorage: context.read<LocalStorage>(),
            ),
            remoteQueueApi: RemoteQueueApi(
              firestore: FirebaseFirestore.instance,
              userId: context.read<LocalStorage>().readAll<UserDTO>().first.uid,
            ),
            localTodoApi: LocalTodoApi(
              localStorage: context.read<LocalStorage>(),
            ),
            remoteTodoApi: RemoteTodoApi(
              firestore: FirebaseFirestore.instance,
              userId: context.read<LocalStorage>().readAll<UserDTO>().first.uid,
            ),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
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
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: TodoBlocAppTheme.lightTheme,
          darkTheme: TodoBlocAppTheme.darkTheme,
          home: const LandingLoadingView(),
        ),
      ),
    );
  }
}
