
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/main.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<String> week = ['월', '화', '수', '목', '금', '토', '일'];
  final columnLength = 30; // 세로 인덱스 길이
  double firstColumnHeight = 20;
  double boxSize = 52;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VinTeumColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            height: ratio.height * 768,
            decoration: BoxDecoration(
              border: Border.all(color: VinTeumColors.darkgrey),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Row(
              children: [
                timeColumn(),
                ...dayColumn(0),
                ...dayColumn(1),
                ...dayColumn(2),
                ...dayColumn(3),
                ...dayColumn(4),
                ...dayColumn(5),
                ...dayColumn(6)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded timeColumn() {
    // 9 to 21 시간
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: firstColumnHeight,
          ),
          ...List.generate(
            columnLength,
                (index) {
              if (index % 2 == 0) {
                return const Divider(
                  color: Colors.grey,
                  height: 0,
                );
              }
              return SizedBox(
                height: boxSize,
                child: Text('${index ~/ 2 + 9}', // 9시부터 시작
                    style: TextStyle(fontSize: 10)),
              );
            },
          ),
        ],
      ),
    );
  }

  List<Widget> dayColumn(int index) {
    // 월-일 요일별
    String currentDay = week[index]; // 현재 열의 요일
    List<Widget> lecturesCurrentDay = []; // 현재 요일에 해당 하는 강의

    for (var lecture in selectedLectures) {
      for (int i = 0; i < lecture.day.length; i++) {
        double top = firstColumnHeight +
            (lecture.start[i] - 9) * boxSize; // 강의의 시작 시간에 따라 컨테이너의 위치를 계산
        double height = (lecture.end[i] - lecture.start[i]) * boxSize; // 강의의 시작 시간과 종료 시간의 차이에 따라 높이를 계산
        if (lecture.day[i] == currentDay) {
          lecturesCurrentDay.add(
            Positioned(
              top: top,
              left: 0,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLectures.remove(lecture);
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 7,
                      height: height,
                      decoration: BoxDecoration(
                        color: ColorGenerator.getRandomColor()
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 7, 2),
                        child: Text(
                          "${lecture.lname}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }
    }

    return [
      const VerticalDivider(
        color: Colors.grey,
        width: 0,
      ),
      Expanded(
        flex: 4,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                  child: Text(
                    '${week[index]}',
                  ),
                ),
                ...List.generate(
                  columnLength.toInt(),
                      (index) {
                    if (index % 2 == 0) {
                      return const Divider(
                        color: Colors.grey,
                        height: 0,
                      );
                    }
                    return SizedBox(
                      height: boxSize,
                      child: Container(),
                    );
                  },
                ),
              ],
            ),
            ...lecturesCurrentDay, // 현재 요일에 해당하는 모든 강의를 Stack에 추가
          ],
        ),
      ),
    ];
  }
}

class ColorGenerator {
  static Random random = Random();

  static Color getRandomColor() {
    int red = random.nextInt(90) + 120;    // 120 ~ 210
    int green = random.nextInt(30) + 160;  // 160 ~ 190
    int blue = random.nextInt(15) + 240;   // 240 ~ 255


    return Color.fromARGB(255, red, green, blue);
  }
}


class Lecture {
  List<String> day;
  List<int> start;
  List<int> end;
  String lname;

  Lecture(this.day, this.start, this.end, this.lname);
}

List<Lecture> selectedLectures = [

  Lecture(
    ['월'],
    [15], // 시작 시간 15:00 PM
    [17], // 종료 시간: 17:00 PM
    '인간관계론', // 강의 이름
  ),

  Lecture(['토'], [13], [17], '알바'),
  Lecture(['화'], [15], [19], '알바'),
  Lecture(['목'], [12], [21], '알바'),
  Lecture(['화'], [9], [10], '알바'),
  Lecture(['화'], [10], [11], '알바'),
  Lecture(['금'], [10], [16], '알바'),





];
