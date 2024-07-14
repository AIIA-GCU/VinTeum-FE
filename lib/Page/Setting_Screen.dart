import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/widget/custom_dialog.dart';
import 'package:vinteum/widget/custom_switch.dart';
import 'package:vinteum/Page/Home_Screen.dart';
import 'package:vinteum/Page/Login_Register_Screen.dart';
import 'package:vinteum/widget/dialog.dart';
import 'package:vinteum/main.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late bool darkmode, notification;

  @override
  void initState() {
    super.initState();
    darkmode = notification = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VinTeumColors.background,
      appBar: AppBar(
        backgroundColor: VinTeumColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("설정",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          child: Container(
              width: double.infinity,
              height: ratio.height * 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Row(
                    children: [
                      Text("다크 모드", style: TextStyle(fontSize: 24)),
                      Spacer(),
                      CustomSwitch(
                        value: darkmode,
                        onChanged: (value) {
                          setState(() => darkmode = value);
                          darkmode = value;
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text("알림", style: TextStyle(fontSize: 24)),
                      Spacer(),
                      CustomSwitch(
                        value: notification,
                        onChanged: (value) {
                          setState(() => notification = value);
                          notification = value;
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OutlinedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 17, vertical: 20)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return nameDialog();
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.edit, color: VinTeumColors.grey3),
                        SizedBox(width: 12),
                        Text(
                          "이름 변경",
                          style: TextStyle(color: VinTeumColors.grey3),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: ratio.height * 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OutlinedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 17, vertical: 20)),
                    onPressed: () {
                      CustomDialog(
                          context: context,
                          title: "로그아웃",
                          dialogContent: "로그아웃 하시겠습니까?",
                          buttonText: "",
                          buttonCount: 2, func: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LoginSignupScreen()));
                      });
                    },
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
                ),
              ])),
        ),
      ),
    );
  }
}
