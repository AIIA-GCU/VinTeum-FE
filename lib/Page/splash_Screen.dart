import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/Page/Login_Register_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginSignupScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VinTeumColors.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              child: Image.asset("assets/logo/logo.png"),
            ),
            SizedBox(height: 20),
            Text("빈 시간을 찾는 플랫폼 빈틈.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          ],
        ),
      ),
    );
  }
}
