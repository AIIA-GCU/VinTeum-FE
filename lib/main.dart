import 'package:flutter/material.dart';
import 'Page/splash_Screen.dart';
import 'package:provider/provider.dart';
import 'package:vinteum/provider/user_provider.dart';
import 'package:vinteum/provider/team_provider.dart';

late Size ratio;


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => TeamProvider()),
      ],
      child: MyApp(),
    ),
  );
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
