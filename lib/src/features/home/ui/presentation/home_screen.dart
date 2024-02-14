import 'package:flutter/material.dart';
import 'package:tutorials/src/features/basic_bloc_tutorial/ui/presentation/basic_bloc_screen.dart';
import 'package:tutorials/src/features/home/ui/presentation/components/home_button.dart';

class HomeScreen extends StatelessWidget {
  static const screenId = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                'Home screen',
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 100),
              HomeButton(
                text: 'Basic Bloc Tutorial',
                onPressed: () {
                  Navigator.pushNamed(context, BasicBlocScreen.screenId);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
