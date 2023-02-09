import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screen/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac_Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameMainScreen(),
    );
  }
}
