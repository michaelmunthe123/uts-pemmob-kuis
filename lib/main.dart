import 'package:flutter/material.dart';
import 'package:kuis/screens/input_name_screen.dart';
import 'package:kuis/screens/quiz_screen.dart';
import 'package:kuis/screens/score_screen.dart';
import 'package:kuis/screens/welcome_screen.dart';
import 'package:kuis/screens/input_name_screen.dart'; // Sesuaikan nama_folder
import 'package:kuis/screens/quiz_screen.dart';
import 'package:kuis/screens/score_screen.dart';
import 'package:kuis/screens/welcome_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        // Anda bisa atur tema (termasuk font kustom) di sini
        // fontFamily: 'NamaFontKustomAnda',
        primarySwatch: Colors.blue,
      ),
      // Kita gunakan 'named routes' untuk navigasi yang rapi
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/input_name': (context) => const InputNameScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/score': (context) => const ScoreScreen(),
      },
    );
  }
}