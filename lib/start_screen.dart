import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() switchScreen;
  const StartScreen(this.switchScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(111, 255, 255, 255),
        ),
        const SizedBox(height: 30),
        Text(
          "Learn Flutter in a fun way!",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          onPressed: switchScreen,
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
        ),
      ],
    );
  }
}
