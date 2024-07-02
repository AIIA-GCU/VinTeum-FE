import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/widget/Group_List.dart';
import 'package:vinteum/Page/Timetable_Screen.dart';

class settingDialog extends StatefulWidget {
  const settingDialog({super.key});

  @override
  State<settingDialog> createState() => _settingDialogState();
}

class _settingDialogState extends State<settingDialog> {
  late bool darkmode, notification;

  @override
  void initState() {
    super.initState();
    darkmode = notification = false;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                width: double.maxFinite,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("다크 모드", style: TextStyle(fontSize: 24)),
                        Spacer(),
                        Switch(value: darkmode,
                            onChanged: (value) {
                              setState(() => darkmode = value);
                              darkmode = value;
                            }),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text("알림", style: TextStyle(fontSize: 24)),
                        Spacer(),
                        Switch(value: notification,
                            onChanged: (value) {
                              setState(() => notification = value);
                              notification = value;
                            }),
                      ],
                    ),
                    SizedBox(height: 20),
                    OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 20)
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.logout, color: VinTeumColors.grey3),
                            SizedBox(width: 12),
                            Text("로그아웃", style: TextStyle(color: VinTeumColors.grey3),)
                          ],
                        ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: VinTeumColors.primaryColor
                      ),
                      onPressed: () {},
                      child: Text("저장", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: VinTeumColors.borderColor)),
        );
      },
    );
  }
}
