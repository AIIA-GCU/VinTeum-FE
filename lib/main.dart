import 'package:flutter/material.dart';
import 'Page/splash_Screen.dart';
late Size ratio;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    ratio = Size(MediaQuery.sizeOf(context).width / 412, MediaQuery.sizeOf(context).height / 892);
    return MaterialApp(
        theme: ThemeData(
            fontFamily: "Pretendard"
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen()
    );
  }
}
