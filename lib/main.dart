import 'package:expensemanager/Acitivities/Loading.dart';

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
        title: 'Expense Manager',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color.fromARGB(255, 80, 80, 80),
            secondary: Color.fromARGB(255, 80, 80, 80),
            tertiary: Color.fromARGB(255, 189, 189, 199),
          ),
          scaffoldBackgroundColor: Color.fromARGB(255, 227, 227, 225),
          fontFamily: 'Agdasima',
          textTheme: TextTheme(
            titleLarge: TextStyle(color: Color.fromARGB(255, 189, 189, 199)),
          ),
        ),
        home: Loading());
  }
}
