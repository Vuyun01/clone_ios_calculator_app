import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator IOS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(137, 23, 22, 22),
          colorScheme: const ColorScheme.light(
              primary: Colors.white,
              secondary: Colors.black,
              tertiary: Colors.orange),
          textTheme: const TextTheme(
              headlineLarge: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              bodyMedium: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 41, 40, 40),
              centerTitle: true)),
      home: const HomeScreen(),
    );
  }
}
