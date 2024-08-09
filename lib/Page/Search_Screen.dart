import 'package:flutter/material.dart';
import 'package:vinteum/Server/controller.dart';
import 'package:vinteum/widget/custom_button.dart';
import 'package:vinteum/widget/custom_dialog.dart';
import 'package:vinteum/main.dart';
import 'package:vinteum/Common/color.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.callback});

  final VoidCallback callback;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController codeNameController = TextEditingController();
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
                      controller: codeNameController,
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
              CustomButton(
                  text: "참여",
                  width: 358,
                  height: 48,
                  func: () {
                    setState(() {
                      if (codeNameController.text.isNotEmpty) {
                        RestAPI.joinTeam(joinCode: codeNameController.text);
                        CustomDialog(
                            context: context,
                            title: "그룹 참여 성공",
                            buttonText: "확인",
                            dialogContent: "그룹 침여가 완료되었습니다.",
                            buttonCount: 1,
                            func: () {
                              Navigator.pop(context);
                              widget.callback();
                              codeNameController.text = '';
                            });
                      } else {
                        CustomDialog(
                            context: context,
                            title: "그룹 참여 실패",
                            dialogContent: "유효한 참여 코드를 입력해주세요.",
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
