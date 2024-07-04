import 'package:flutter/material.dart';
import 'package:vinteum/Page/Home_Screen.dart';
import 'package:vinteum/Page/Make_Screen.dart';
import 'package:vinteum/Page/Detail_Screen1.dart';
import 'package:vinteum/Page/Detail_Screen2.dart';
import 'package:vinteum/Page/Detail_Screen3.dart';
import 'widget/root_tab.dart';
import 'package:vinteum/config/variable.dart';

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
      //  debugShowCheckedModeBanner: false,
      //  home: RootTab()
      home: DetailScreen()
    );
  }
}
