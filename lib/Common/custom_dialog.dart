import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:vinteum/Common/color.dart";
import 'package:vinteum/main.dart';

Future<void> CustomDialog({
  bool barrierDismissible = true,
  required BuildContext context,
  required String title,
  required String dialogContent,
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
            title: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            content: Container(
              height: ratio.height * 30,
              child: Center(
                  child: Text(dialogContent, style: TextStyle(fontSize: 17))),
            ),
            actions: <Widget>[
              buttonCount == 2
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  : Center(
                      child: TextButton(
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
