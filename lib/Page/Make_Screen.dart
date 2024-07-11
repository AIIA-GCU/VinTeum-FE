import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/Common/custom_button.dart';
import 'package:vinteum/main.dart';

class MakeScreen extends StatefulWidget {
  const MakeScreen({super.key, required this.selected});

  final bool selected;

  @override
  State<MakeScreen> createState() => _MakeScreenState();
}

class _MakeScreenState extends State<MakeScreen> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VinTeumColors.background,
        body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ratio.height * 80),
                    Text(
                      "그룹명을 입력하세요.",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: ratio.height * 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "그룹명",
                          style: TextStyle(
                              fontSize: 20, color: VinTeumColors.darkgrey),
                        ),
                      ],
                    ),
                    selected == false
                        ? TextField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: VinTeumColors.mainBlue),
                              ),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: VinTeumColors.mainBlue),
                                  ),
                                ),
                              ),
                              SizedBox(height: ratio.height * 30),
                              Text(
                                "참여 코드",
                                style: TextStyle(
                                    fontSize: 20, color: VinTeumColors.darkgrey),
                              ),
                              SizedBox(height: ratio.height * 30),
                             Divider(color: VinTeumColors.darkgrey)
                            ],
                          )
                  ],
                ),
              ),
              Spacer(),
              CustomButton(
                  text: "생성",
                  func: () {
                    setState(() {
                      selected = true;
                    });
                  },
                  buttonCount: 1)
            ],
          ),
        ),
      ),
    );
  }
}
