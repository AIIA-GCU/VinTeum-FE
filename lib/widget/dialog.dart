import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';

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
            Container(
              width: double.maxFinite,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Text("다크 모드", style: TextStyle(fontSize: 24)),
                        Spacer(),
                        Switch(
                            value: darkmode,
                            onChanged: (value) {
                              setState(() => darkmode = value);
                              darkmode = value;
                            }),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("알림", style: TextStyle(fontSize: 24)),
                      Spacer(),
                      Switch(
                          value: notification,
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
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 17, vertical: 20)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.logout, color: VinTeumColors.grey3),
                        SizedBox(width: 12),
                        Text(
                          "로그아웃",
                          style: TextStyle(color: VinTeumColors.grey3),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: VinTeumColors.primaryColor),
                    onPressed: () {},
                    child: Text("저장", style: TextStyle(color: Colors.white)),
                  ),
                ],
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

class nameDialog extends StatefulWidget {
  const nameDialog({super.key});

  @override
  State<nameDialog> createState() => _nameDialogState();
}

class _nameDialogState extends State<nameDialog> {
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          title: Center(child: const Text('이름 변경')),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: "이름을 입력해주세요."),
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: VinTeumColors.primaryColor),
                onPressed: () => Navigator.pop(context, _nameController.text),
                child: Text("저장", style: TextStyle(color: Colors.white)),
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
