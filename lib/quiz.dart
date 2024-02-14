import 'package:flutter/material.dart';

import 'package:multiplator/start_screen.dart';
import 'package:multiplator/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //var activeScreen = 'start-screen';
  var activeScreen = 'questions-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = const QuestionsScreen();
    }

    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize:  12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans',
            //color: Colors.blueAccent,
          ),
          bodyLarge: TextStyle(
            fontSize:  24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans',
            color: Colors.amberAccent,
          ),
          displayLarge: TextStyle(
            fontSize:  34,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans',
            color: Colors.amber,
          ),
          labelLarge: TextStyle(
            fontSize:  40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans',
            color: Colors.amber,
          ),
          labelMedium: TextStyle(
            fontSize:  30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans',
            color: Colors.green,
          ),
          labelSmall: TextStyle(
            fontSize:  30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open Sans',
            color: Colors.red,
          )
          // Add other text styles as needed
        ).apply(
          fontFamily: 'Open Sans',
          //bodyColor: Colors.black,
          //displayColor: Colors.black,
        ),
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 206, 252),
                Color.fromARGB(255, 19, 122, 252),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
