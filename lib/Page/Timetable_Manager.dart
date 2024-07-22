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

  double _bottomSheetHeight = 100; // Initial height for the BottomSheet
  final double _minHeight = 100;
  final double _maxHeight = 600;

  void _showBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return GestureDetector(
            onVerticalDragUpdate: (details) {
          setState(() {
            _bottomSheetHeight -= details.primaryDelta!;
            if (_bottomSheetHeight < _minHeight) {
              _bottomSheetHeight = _minHeight;
            } else if (_bottomSheetHeight > _maxHeight) {
              _bottomSheetHeight = _maxHeight;
            }
          });
        },
        onVerticalDragEnd: (details) {
        // Optionally animate to a specific size or state
        },
        child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _bottomSheetHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: ratio.height * 10,),
                  Container(
                    height: ratio.height * 7,
                    width: ratio. width * 65,
                    decoration: BoxDecoration(
                      color: VinTeumColors.mainBlue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  // Header section
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      // border: Border(
                      //   bottom: BorderSide(
                      //     color: VinTeumColors.grey,
                      //     width: 1.0,
                      //   ),
                      // ),
                    ),
                    child: Center(
                      child: Text(
                        '일정 등록하기',
                        style: TextStyle(fontSize:16)
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      // controller: scrollController,
                      padding: EdgeInsets.only(left: 30, right: 30, top: 5),
                      children: <Widget>[
                        TextField(
                          controller: name,
                          decoration: InputDecoration(
                            labelText: '일정 이름',
                            labelStyle: TextStyle(
                              color: VinTeumColors.darkgrey,
                              fontSize: 16,
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
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                        SizedBox(height: ratio.height * 150.0),
                        CustomButton(width: 150, height: 48, text: '',
                            func: (){
                              print('일정 이름: ${name.text}');
                              print('요일: ${date.text}');
                              print('시작 시간: ${start_time.text}');
                              print('종료 시간: ${end_time.text}');
                              Navigator.pop(context);

                            },
                            buttonCount: 2),
                        // ElevatedButton(
                        //   child: Text('저장'),
                        //   onPressed: () {
                        //     print('일정 이름: ${name.text}');
                        //     print('요일: ${date.text}');
                        //     print('시작 시간: ${start_time.text}');
                        //     print('종료 시간: ${end_time.text}');
                        //     Navigator.pop(context);
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
             ),
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
          onPressed: (){
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
          Positioned( // cotainer를 화면 화단에 고정
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(  // 사용자의 제스처를 감지 (수직 드래그)
              onVerticalDragUpdate: (details) {  // 사용자가 수직으로 드래그할 때 호출됨
                if (details.primaryDelta! < 0) { // 사용자가 위쪽으로 드래그할때 함수 호출
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
                      SizedBox(height: ratio.height * 10,),
                      Container(
                        height: ratio.height * 7,
                        width: ratio. width * 65,
                        decoration: BoxDecoration(
                          color: VinTeumColors.mainBlue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(height: ratio.height * 7),
                      Text('일정 등록하기',
                          style: TextStyle(fontSize:16)),
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


