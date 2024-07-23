import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/widget/custom_button.dart';
import 'package:vinteum/widget/custom_dialog.dart';
import 'package:vinteum/main.dart';

class TimetableManager extends StatefulWidget {
  @override
  _TimetableManagerState createState() => _TimetableManagerState();
}

class _TimetableManagerState extends State<TimetableManager> {
  final TextEditingController name = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController start_time = TextEditingController();
  final TextEditingController end_time = TextEditingController();
  late bool isSelect = false;

  void _showBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          snapSizes: [
            0.4,
            0.8
          ],
          initialChildSize: 0.2,
          // Initial size so header is visible
          minChildSize: 0.2,
          // Minimum size to ensure header is visible
          maxChildSize: 0.8,
          // Maximum size user can drag up to
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              height: ratio.height * 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: <Widget>[
                  // 헤더와 내용 모두 스크롤 가능한 영역에 포함되도록 ListView로 감싸기
                  Container(
                    width: ratio.width * 65,
                    height: ratio.height * 7,
                    decoration: BoxDecoration(
                      color: VinTeumColors.mainBlue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    margin: EdgeInsets.only(top: ratio.height * 10),
                  ),
                  ListView(
                    shrinkWrap: true,
                    controller: scrollController,
                    padding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    children: <Widget>[
                      // 헤더 부분
                      Center(
                        child: Text(
                          '일정 등록하기',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: ratio.height * 10),
                      // 나머지 입력 폼들
                      TextField(
                        controller: name,
                        decoration: InputDecoration(
                          labelText: '일정 이름',
                          labelStyle: TextStyle(
                            color: VinTeumColors.darkgrey,
                            fontSize: 16,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: VinTeumColors.mainBlue),
                          ),
                        ),
                      ),
                      SizedBox(height: ratio.height * 15.0),
                      TextField(
                        controller: date,
                        decoration: InputDecoration(
                          labelText: '요일',
                          labelStyle: TextStyle(
                            color: VinTeumColors.darkgrey,
                            fontSize: 16,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: VinTeumColors.mainBlue),
                          ),
                        ),
                      ),
                      SizedBox(height: ratio.height * 15.0),
                      TextField(
                        controller: start_time,
                        decoration: InputDecoration(
                          labelText: '시작 시간',
                          labelStyle: TextStyle(
                            color: VinTeumColors.darkgrey,
                            fontSize: 16,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: VinTeumColors.mainBlue),
                          ),
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                      SizedBox(height: ratio.height * 15.0),
                      TextField(
                        controller: end_time,
                        decoration: InputDecoration(
                          labelText: '종료 시간',
                          labelStyle: TextStyle(
                            color: VinTeumColors.darkgrey,
                            fontSize: 16,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: VinTeumColors.mainBlue),
                          ),
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                      SizedBox(height: ratio.height * 150.0),
                      isSelect == true
                          ? Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            VinTeumColors.subBlue2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                SizedBox(width: ratio.width * 12),
                                Expanded(
                                  child: TextButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            VinTeumColors.mainBlue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                ],
              ),
            );
          },
        );
      },
    );
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
          icon: Icon(
            Icons.arrow_back_ios,
            color: VinTeumColors.grey,
          ),
        ),
        title: Text("시간표 관리",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Text('일정을 등록 및 수정하세요.'),
          ),
          // Fixed container at the bottom
          Positioned(
            // cotainer를 화면 화단에 고정
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              // 사용자의 제스처를 감지 (수직 드래그)
              onVerticalDragUpdate: (details) {
                // 사용자가 수직으로 드래그할 때 호출됨
                if (details.primaryDelta! < 0) {
                  // 사용자가 위쪽으로 드래그할때 함수 호출
                  _showBottomSheet();
                }
              },
              child: Container(
                height: ratio.height * 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: ratio.height * 10,
                      ),
                      Container(
                        height: ratio.height * 7,
                        width: ratio.width * 65,
                        decoration: BoxDecoration(
                          color: VinTeumColors.mainBlue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: ratio.height * 7),
                      Text('일정 등록하기', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TimetableManager(),
  ));
}
