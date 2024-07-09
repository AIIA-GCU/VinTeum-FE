import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:vinteum/Common/color.dart";
import 'package:vinteum/main.dart';

Future<void> CustomDialog({
  bool barrierDismissible = true,
  required BuildContext context,
  required String title,
  required String? buttonText,
  required int buttonCount,
  required VoidCallback func,
}) {
  return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              buttonCount == 2
                  ? Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: VinTeumColors.subBlue2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      onPressed: func,
                      child: Text(
                        '취소',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: VinTeumColors.mainBlue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: ratio.width * 12),
                  Expanded(
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: VinTeumColors.mainBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '확인',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  : TextButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: VinTeumColors.mainBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                onPressed: func,
                child: Text(
                  buttonText!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(color: VinTeumColors.borderColor)),
          );
        });
      });
}
