import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/widget/custom_dialog.dart';
import 'package:vinteum/main.dart';

class TimetableManager extends StatefulWidget {
  TimetableManager({Key? key}) : super(key: key);

  @override
  _TimetableManagerState createState() => _TimetableManagerState();
}

class _TimetableManagerState extends State<TimetableManager> {
  final TextEditingController name = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController start_time = TextEditingController();
  final TextEditingController end_time = TextEditingController();

  void _showBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.2, // Set initial size to make the header visible
          minChildSize: 0.2, // Minimum size to make sure the header remains visible
          maxChildSize: 0.8, // Maximum size user can drag up to
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  // Header section
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '일정 추가',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Main content area
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      padding: EdgeInsets.all(16.0),
                      children: <Widget>[
                        TextField(
                          controller: name,
                          decoration: InputDecoration(
                            labelText: '일정 이름',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextField(
                          controller: date,
                          decoration: InputDecoration(
                            labelText: '요일',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextField(
                          controller: start_time,
                          decoration: InputDecoration(
                            labelText: '시작 시간',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                        SizedBox(height: 16.0),
                        TextField(
                          controller: end_time,
                          decoration: InputDecoration(
                            labelText: '종료 시간',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          child: Text('저장'),
                          onPressed: () {
                            print('일정 이름: ${name.text}');
                            print('요일: ${date.text}');
                            print('시작 시간: ${start_time.text}');
                            print('종료 시간: ${end_time.text}');
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
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
        title: Text("시간표 관리"),
        titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Show Bottom Sheet'),
          onPressed: _showBottomSheet, // Show Bottom Sheet when button is pressed
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TimetableManager(),
  ));
}

