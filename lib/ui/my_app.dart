import 'package:work_app/constants/app_theme.dart';
import 'package:work_app/constants/strings.dart';
import 'package:work_app/data/repository.dart';
import 'package:work_app/di/components/injection.dart';
import 'package:work_app/stores/form/form_store.dart';
import 'package:work_app/stores/work/work_store.dart';
import 'package:work_app/ui/splash/splash.dart';
import 'package:work_app/utils/routes/routes.dart';
import 'package:work_app/stores/language/language_store.dart';
import 'package:work_app/stores/theme/theme_store.dart';
import 'package:work_app/stores/user/user_store.dart';
import 'package:work_app/ui/home/home.dart';
import 'package:work_app/ui/login/login.dart';
import 'package:work_app/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final ThemeStore _themeStore = ThemeStore(getIt<Repository>());
  final WorkStore _postStore = WorkStore(getIt<Repository>());
  final LanguageStore _languageStore = LanguageStore(getIt<Repository>());
  final UserStore _userStore = UserStore(getIt<Repository>());
  final FormStore _formStore = FormStore(getIt<Repository>());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => _themeStore),
        Provider<WorkStore>(create: (_) => _postStore),
        Provider<FormStore>(create: (_) => _formStore),
        Provider<LanguageStore>(create: (_) => _languageStore),
      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            theme: _themeStore.darkMode ? themeDataDark : themeData,
            routes: Routes.routes,
            locale: Locale(_languageStore.locale),
            darkTheme: themeData,

            supportedLocales: _languageStore.supportedLanguages
                .map((language) => Locale(language.locale!, language.code))
                .toList(),
            localizationsDelegates: [
              // A class which loads the translations from JSON files
              AppLocalizations.delegate,
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate,
            ],
            home: _userStore.isLoggedIn ? SplashScreen() : HomeScreen(),
          );
        },
      ),
    );
  }
}