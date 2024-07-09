import 'package:flutter/material.dart';
import 'package:vinteum/Common/custom_button.dart';
import 'package:vinteum/main.dart';
import 'package:vinteum/Common/color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
                      "참여 코드를 입력하세요.",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: ratio.height * 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "참여 코드",
                          style: TextStyle(
                              fontSize: 20, color: VinTeumColors.darkgrey),
                        ),
                      ],
                    ),
                    TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: VinTeumColors.mainBlue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomButton(text: "참여", func: () {}, buttonCount: 1)
            ],
          ),
        ),
      ),
    );
  }
}
