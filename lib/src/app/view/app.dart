import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:realm/realm.dart';
import 'package:todo_bloc/src/core/constants/theme.dart';
import 'package:todo_bloc/src/data/api/todo_api.dart';
import 'package:todo_bloc/src/data/local_storage/local_storage.dart';
import 'package:todo_bloc/src/data/local_storage/local_storage_impl.dart';
import 'package:todo_bloc/src/data/repositories/connection_checker/connection_checker.dart';
import 'package:todo_bloc/src/data/repositories/connection_checker/connection_checker_impl.dart';
import 'package:todo_bloc/src/data/repositories/settings/settings_repository.dart';
import 'package:todo_bloc/src/data/repositories/settings/settings_repository_impl.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository_impl.dart';
import 'package:todo_bloc/src/l10n/l10n.dart';
import 'package:todo_bloc/src/modules/connection_checker/bloc/connection_checker_bloc.dart';
import 'package:todo_bloc/src/modules/landing_loading/view/landing_loading_view.dart';
import 'package:todo_bloc/src/modules/settings/cubit/settings_cubit.dart';

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
        RepositoryProvider<TodoRepository>(
          create: (context) => TodoRepositoryImpl(
            todoApi: TodoApi(
              localStorage: context.read<LocalStorage>(),
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
            )..add(const ConnectionCheckerInitializationRequested()),
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
