import 'package:flutter/material.dart';
import 'package:tutorials/src/features/basic_bloc_tutorial/ui/presentation/basic_bloc_screen.dart';
import 'package:tutorials/src/features/home/ui/presentation/home_screen.dart';

class TutorialApp extends StatelessWidget {
  const TutorialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.screenId,
      routes: {
        HomeScreen.screenId: (context) => const HomeScreen(),
        BasicBlocScreen.screenId: (context) => const BasicBlocScreen(),
      },
    );
  }
}
