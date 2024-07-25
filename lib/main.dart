import 'package:flutter/material.dart';
import 'Page/splash_Screen.dart';
import 'package:vinteum/model/user.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';

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
            fontFamily: "Pretendard",
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),

        debugShowCheckedModeBanner: false,
        home: SplashScreen()
    );
  }
}
