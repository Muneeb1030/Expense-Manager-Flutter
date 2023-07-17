import 'dart:async';
import 'dart:ui';

import 'package:expensemanager/Acitivities/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      },
    );
  }

  void MainActitvity() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              color: Color.fromARGB(255, 236, 236, 234),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Expense Manager",
              style: TextStyle(
                fontSize: 48,
                color: Color.fromARGB(255, 236, 236, 234),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            SpinKitWave(
              color: Color.fromARGB(255, 236, 236, 234),
              size: 60,
            )
          ],
        ),
      ),
    );
  }
}
