import 'package:flutter/material.dart';
import 'package:islami_app/Home/home_screen.dart';
import 'package:islami_app/hadeth_tab/hadeth_details_screen.dart';
import 'package:islami_app/helpers/cash_helper.dart';
import 'package:islami_app/onboarding_screen/onboarding_screen.dart';
import 'package:islami_app/quran_tab/sura_details_screen.dart';
import 'package:islami_app/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  bool? onBoarding = CashHelper.getData(key: 'onBoarding');
  String initialScreen;
  if (onBoarding != null) {
    initialScreen = HomeScreen.routeName;
  } else {
    initialScreen = OnboardingScreen.routeName;
  }
  runApp(IslamiApp(
    initialScreen: initialScreen,
  ));
}

class IslamiApp extends StatelessWidget {
  final String initialScreen;

  const IslamiApp({super.key, required this.initialScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: initialScreen,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraDetailsScreen.routeName: (context) => const SuraDetailsScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        HadethDetailsScreen.routeName: (context) => const HadethDetailsScreen(),
      },
    );
  }
}
