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
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 241, 108, 38),
              Color.fromARGB(255, 150, 39, 129)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Expense Manager",
              style: TextStyle(
                fontSize: 48,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            SpinKitWave(
              color: Colors.white70,
              size: 60,
            )
          ],
        ),
      ),
    );
  }
}
