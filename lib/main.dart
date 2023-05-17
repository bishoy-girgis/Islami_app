import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/hades/hades_screen.dart';
import 'package:flutter_application_2/home/home_screen.dart';
import 'package:flutter_application_2/home/provider/setting_provider.dart';
import 'package:flutter_application_2/home/quran/sura_screen.dart';
import 'package:flutter_application_2/my_theme.dart';
import 'package:flutter_application_2/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => SettingProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      title: 'Islami App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.Darktheme,
      themeMode: settingsProvider.currentTheme,
      locale: Locale(settingsProvider.currentLocal),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraScreen.routeName: (context) => SuraScreen(),
        HadesScreen.routeName: (context) => HadesScreen(),
        SplashScreen.routeName: (context) => SplashScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
