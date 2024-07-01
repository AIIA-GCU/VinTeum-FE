import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/Page/Home_Screen.dart';
import 'package:vinteum/Page/Make_Screen.dart';

class GroupList extends StatelessWidget {
  final String title;
  final String number;
  const GroupList({
    required this.title,
    required this.number,
    super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: VinTeumColors.mainColor,
          borderRadius: BorderRadius.circular(10),
            border: Border.all(color: VinTeumColors.borderColor, width: 1
            )
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                    title,
                    style: TextStyle(
                        fontSize: 32, color: Colors.black)
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("Assets/img/user.png"),
                    Text(
                        number,
                        style: TextStyle(
                            fontSize: 24, color: Colors.black)
                    ),
                    SizedBox(width: 40)
                  ],
                )
              ],
            ),
            Spacer(),
            Image.asset("Assets/img/navigate.png")
          ],
        ),

      ),
    );
  }
}
