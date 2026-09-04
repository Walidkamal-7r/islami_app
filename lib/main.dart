import 'package:flutter/material.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:islami_app/ui/screens/home/home_screen.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/sura_details/sura_details_screen.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/sura_details1/sura_details_screen1.dart';
import 'package:islami_app/ui/screens/onboarding/onboarding_screen.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboardingRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.onboardingRouteName: (context) => OnboardingScreenScreen(),
        AppRoutes.suraDetailsRouteName: (context) => SuraDetailsScreen(),
        AppRoutes.suraDetails1RouteName: (context) => SuraDetailsScreen1(),
      },
    );
  }
}
