import 'package:bmicalculatorapp/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF00000000),
        scaffoldBackgroundColor: Color(0xFF00000000)
      ),home: MainScreen(),
    );
  }
}

