import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/main.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback func;
  final Color textColor;
  final Color backgroundColor;
  final int buttonCount;
  final int width;
  final int height;
  const CustomButton({
    required this.width,
    required this.height,
    required this.text,
    required this.func,
    this.textColor = Colors.white,
    this.backgroundColor = VinTeumColors.mainBlue,
    required this.buttonCount,
    super.key,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: buttonCount == 1 ? Container(
        width: ratio.width * width,
        height: ratio.height * height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: textColor,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ):
      Row(
        children: [
          Expanded(
            child: Container(
                width: ratio.width * width,
                height: ratio.height * height,
                decoration: BoxDecoration(
                  color: VinTeumColors.mainBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "등록",
                    style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ),
          ),
          SizedBox(width: ratio.width * 25),
          Expanded(
            child: Container(
                width: ratio.width * width,
                height: ratio.height * height,
                decoration: BoxDecoration(
                  color: VinTeumColors.subBlue2,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "삭제",
                    style: TextStyle(
                        fontSize: 20,
                        color: VinTeumColors.mainBlue,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ),
          ),
        ],
      )
    );
  }
}
