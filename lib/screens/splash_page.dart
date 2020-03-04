import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 7),
      () => Navigator.of(context).pushNamed('/user'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextLiquidFill(
          text: 'Flash Chat',
          waveColor: Colors.black,
          boxBackgroundColor: Colors.blueGrey,
          textStyle: TextStyle(
            fontSize: 65.0,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: MediaQuery.of(context).size.height,
          boxWidth: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
