import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/widget/custom_button.dart';
import 'package:vinteum/widget/custom_dialog.dart';
import 'package:vinteum/Page/Detail_Screen2.dart';
import 'package:vinteum/main.dart';
import 'package:flutter/services.dart';
import 'package:vinteum/widget/freetime_table.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.number});

  final int? number;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: VinTeumColors.background,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: VinTeumColors.grey,
            ),
          ),
          title: Text("그룹명"),
          //타이틀 -> 폰트 바꾸기
          titleTextStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          centerTitle: true,
          backgroundColor: VinTeumColors.background,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: ratio.height * 20),
              Row(
                children: [
                  SizedBox(
                    width: ratio.width * 242,
                  ),
                  GestureDetector(
                    onTap: () {
                      String EnterKey = "adadadad";
                      Clipboard.setData(ClipboardData(text: EnterKey));
                      Fluttertoast.showToast(
                          msg: "복사되었습니다.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: VinTeumColors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    child: Row(
                      children: [
                        Text(
                          "참여 코드 복사",
                          style: TextStyle(
                            color: VinTeumColors.darkgrey,
                            fontSize: 16,
                          ),
                        ),
                        Image.asset('assets/img/download.png'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: ratio.width * 15,
                  ),
                  Container(
                    child: Text(
                      '공통 시간',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: VinTeumColors.mainBlue),
                    ),
                  ),
                  SizedBox(width: ratio.width * 110),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen2()),
                      );
                    },
                    child: Container(
                      width: ratio.width * 144,
                      height: ratio.height * 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        border: Border.all(color: VinTeumColors.darkgrey),
                      ),
                      child: Center(
                        child: Text(
                          '그룹 인원: ${widget.number}',
                          style: TextStyle(
                            fontSize: 16,
                            color: VinTeumColors.darkgrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: ratio.height * 600,
                // width: ratio.width * 357,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    child: FreeTimeTable()),
              ),
              SizedBox(
                height: ratio.height * 20,
              ),
              CustomButton(
                  text: "그룹 삭제",
                  width: 315,
                  height: 42,
                  func: () {
                    CustomDialog(
                        context: context,
                        title: "그룹 삭제",
                        dialogContent: "그룹을 삭제하시겠습니까?",
                        buttonText: "",
                        buttonCount: 2,
                        func: () {});
                  },
                  buttonCount: 1)
            ],
          ),
        ),
      ),
    );
  }
}
