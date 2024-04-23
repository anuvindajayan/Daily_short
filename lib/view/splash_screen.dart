import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapplication/view/bottom_nav/mainScreen.dart';

class Newssplash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _splash2state();
}

class _splash2state extends State<Newssplash> {
  @override
  void initState() {
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Main_Screen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          child: Center(
              child:
                  Lottie.asset("assets/animation/dailyshort_animation.json"))),
    );
  }
}
