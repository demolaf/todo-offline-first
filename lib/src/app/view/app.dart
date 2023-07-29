import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/src/l10n/l10n.dart';
import 'package:todo_bloc/src/modules/landing_loading/view/landing_loading_view.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // Used to select if we use the dark or light theme, start with system mode.
  ThemeMode themeMode = ThemeMode.system;

  // Opt in/out on Material-3
  bool useMaterial3 = true;

  @override
  Widget build(BuildContext context) {
    const usedScheme = FlexScheme.mandyRed;

    return MultiRepositoryProvider(
      providers: [
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // Use the above dark or light theme based on active themeMode.
            themeMode: themeMode,
            theme: FlexThemeData.light(
              scheme: usedScheme,
              // Use very subtly themed app bar elevation in light mode.
              appBarElevation: 0.5,
              useMaterial3: useMaterial3,
              // We use the nicer Material-3 Typography in both M2 and M3 mode.
              typography: Typography.material2021(
                  platform: defaultTargetPlatform),
            ),
            darkTheme: FlexThemeData.dark(
              scheme: usedScheme,
              // Use a bit more themed elevated app bar in dark mode.
              appBarElevation: 2,
              useMaterial3: useMaterial3,
              // We use the nicer Material-3 Typography in both M2 and M3 mode.
              typography: Typography.material2021(
                  platform: defaultTargetPlatform),
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const LandingLoadingView(),
          );
        },
      ),
    );
  }
}
