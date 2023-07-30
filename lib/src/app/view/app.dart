import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/src/core/constants/theme.dart';
import 'package:todo_bloc/src/data/repositories/settings/settings_repository.dart';
import 'package:todo_bloc/src/data/repositories/settings/settings_repository_impl.dart';
import 'package:todo_bloc/src/l10n/l10n.dart';
import 'package:todo_bloc/src/modules/landing_loading/view/landing_loading_view.dart';
import 'package:todo_bloc/src/modules/settings/cubit/settings_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SettingsRepository>(
          create: (context) => SettingsRepositoryImpl(),
        ),
      ],
      child: BlocProvider(
        create: (context) => SettingsCubit(),
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
