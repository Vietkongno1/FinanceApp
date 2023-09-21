import 'package:financeapp/src/View/HomeScreen.dart';
import 'package:financeapp/src/View/Statistics.dart';
import 'package:financeapp/widget/bottomNavigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Bottom(),
    );
  }
}

