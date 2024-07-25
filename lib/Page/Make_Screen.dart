import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/widget/custom_button.dart';
import 'package:vinteum/widget/custom_dialog.dart';
import 'package:vinteum/Page/Home_Screen.dart';
import 'package:vinteum/main.dart';
import 'package:vinteum/widget/root_tab.dart';

class MakeScreen extends StatefulWidget {
  const MakeScreen({super.key, required this.selected, required this.callback});

  final bool selected;
  final VoidCallback callback;

  @override
  State<MakeScreen> createState() => _MakeScreenState();
}

class _MakeScreenState extends State<MakeScreen> {
  bool selected = false;
  final TextEditingController groupNameController = TextEditingController();

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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                    TextField(
                      controller: groupNameController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: VinTeumColors.mainBlue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              CustomButton(
                  text: "생성",
                  width: 358,
                  height: 48,
                  func: () {
                    setState(() {
                      selected = true;
                      if (groupNameController.text.isNotEmpty) {
                        CustomDialog(
                            context: context,
                            title: "그룹 생성",
                            buttonText: "확인",
                            dialogContent: "그룹 생성이 완료되었습니다.",
                            buttonCount: 1,
                            func: () {
                              Navigator.pop(context);
                              widget.callback();
                              groupNameController.text = '';
                            });
                      } else {
                        CustomDialog(
                            context: context,
                            title: "그룹 생성",
                            dialogContent: "그룹명을 입력해주세요.",
                            buttonText: "확인",
                            buttonCount: 1,
                            func: () {
                              Navigator.pop(context);
                            });
                      }
                    });
                  },
                  buttonCount: 1),
            ],
          ),
        ),
      ),
    );
  }
}
