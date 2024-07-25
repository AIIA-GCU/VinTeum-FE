import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/widget/custom_button.dart';

class TimetableManager extends StatelessWidget {
  final ScrollController scrollController;

  TimetableManager({required this.scrollController});

  final TextEditingController name = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController start_time = TextEditingController();
  final TextEditingController end_time = TextEditingController();
  late bool isSelect = false;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 65,
            height: 7,
            decoration: BoxDecoration(
              color: VinTeumColors.mainBlue,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            margin: EdgeInsets.only(top: 10),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              controller: scrollController,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              children: <Widget>[
                Center(
                  child: Text(
                    '일정 등록하기',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: '일정 이름',
                    labelStyle: TextStyle(
                      color: VinTeumColors.darkgrey,
                      fontSize: 16,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: VinTeumColors.mainBlue),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                TextField(
                  controller: date,
                  decoration: InputDecoration(
                    labelText: '요일',
                    labelStyle: TextStyle(
                      color: VinTeumColors.darkgrey,
                      fontSize: 16,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: VinTeumColors.mainBlue),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                TextField(
                  controller: start_time,
                  decoration: InputDecoration(
                    labelText: '시작 시간',
                    labelStyle: TextStyle(
                      color: VinTeumColors.darkgrey,
                      fontSize: 16,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: VinTeumColors.mainBlue),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: 15.0),
                TextField(
                  controller: end_time,
                  decoration: InputDecoration(
                    labelText: '종료 시간',
                    labelStyle: TextStyle(
                      color: VinTeumColors.darkgrey,
                      fontSize: 16,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: VinTeumColors.mainBlue),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: 50.0),
                isSelect == false
                    ? Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: VinTeumColors.subBlue2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          '삭제',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: VinTeumColors.mainBlue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: VinTeumColors.mainBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                        onPressed: () {
                          print('일정 이름: ${name.text}');
                          print('요일: ${date.text}');
                          print('시작 시간: ${start_time.text}');
                          print('종료 시간: ${end_time.text}');
                          Navigator.pop(context);
                        },
                        child: Text(
                          '등록',
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
                    : CustomButton(
                    width: 150,
                    height: 48,
                    text: '등록',
                    func: () {
                      print('일정 이름: ${name.text}');
                      print('요일: ${date.text}');
                      print('시작 시간: ${start_time.text}');
                      print('종료 시간: ${end_time.text}');
                      Navigator.pop(context);
                    },
                    buttonCount: 1)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
