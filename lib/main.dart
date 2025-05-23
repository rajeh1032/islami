import 'package:flutter/material.dart';
import 'package:islami/providers/most_recentley_provider.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/home/tabs/quran/details/soura_details_screen.dart';
import 'package:islami/ui/home/tabs/quran/details/sura_content.dart';
import 'package:islami/ui/onboarding/on_boarding_screen.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
      create: (context) => MostRecentleyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        SouraDetailsScreen.routeName: (context) => SouraDetailsScreen(),
        SuraContent.routeName: (context) => SuraContent(),
      },
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
