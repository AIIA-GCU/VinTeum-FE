import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/main.dart';

class MakeScreen extends StatelessWidget {
  const MakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: ratio.height * 86,
          ),
          Text(
            "그룹 생성",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: ratio.height * 96,
          ),
          Row(
            children: [
              SizedBox(
                width: ratio.width * 12,
              ),
              Text(
                "그룹명을 입력하세요.",
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          SizedBox(
            height: ratio.height * 21,
          ),
          Container(
              width: ratio.width * 317,
              height: ratio.height * 47,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: VinTeumColors.borderColor,
                      width: 1
                  ),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "그룹명을 입력하세요.",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                ),
              )
          ),
          SizedBox(
            height: ratio.height * 101,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: VinTeumColors.primaryColor),
            onPressed: () {},
            child: Text("생성", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
