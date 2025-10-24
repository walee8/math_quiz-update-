import 'dart:async';
import 'package:flutter/material.dart';
import 'package:math_game/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;

  @override
  void initState(){
    super.initState();

    //Animate loading bar
    Timer.periodic (const Duration(milliseconds: 100), (timer){
      setState(() {
        progress +=0.05;
        if (progress > 1.0) progress = 0.0;
      });
    });
    //Navigate to HomePage after 2 seconds
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    'Math Quiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 200,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Loading...",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),


          )
      )

    );
  }
}
