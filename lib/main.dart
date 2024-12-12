import 'package:flutter/material.dart';
import 'package:islami_app/Home/home_screen.dart';
import 'package:islami_app/hadeth_tab/hadeth_details_screen.dart';
import 'package:islami_app/onboarding_screen/onboarding_screen.dart';
import 'package:islami_app/quran_tab/sura_details_screen.dart';
import 'package:islami_app/themes/app_theme.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraDetailsScreen.routeName: (context) => const SuraDetailsScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        HadethDetailsScreen.routeName: (context) => const HadethDetailsScreen(),
      },
    );
  }
}
