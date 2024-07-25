import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/main.dart';
import 'package:vinteum/widget/TImetable_Manager.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<String> week = ['월', '화', '수', '목', '금', '토', '일'];
  final columnLength = 30; // 세로 인덱스 길이
  double firstHeight = 20;
  double boxSize = 52; //한칸의 크기

  void _showBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.8,
          minChildSize: 0.8,
          maxChildSize: 0.8,
          builder: (BuildContext context, ScrollController scrollController) {
            return TimetableManager(scrollController: scrollController);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ratio.height * 768,
      decoration: BoxDecoration(
        border: Border.all(color: VinTeumColors.darkgrey),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          timeColumn(),
          for (int i = 0; i < week.length; i++) ...dayColumn(i),
        ],
      ),
    );
  }

  Widget timeColumn() {
    // 9 to 21 시간
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: firstHeight),
          ...List.generate(
            columnLength,
            (index) => index % 2 == 0
                ? const Divider(color: Colors.grey, height: 0)
                : SizedBox(
                    height: boxSize,
                    child: Text(
                      '${index ~/ 2 + 9}', // 9시부터 시작
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
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
        if (lecture.day[i] == currentDay) {
          double top = firstHeight + (lecture.start[i] - 9) * boxSize; // 강의의 시작 시간에 따라 컨테이너의 위치를 계산
          double height = (lecture.end[i] - lecture.start[i]) * boxSize; // 강의의 시작 시간과 종료 시간의 차이에 따라 높이를 계산

          lecturesCurrentDay.add(
            Positioned(
              top: top,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  _showBottomSheet();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 7,
                  height: height,
                  decoration: BoxDecoration(
                    color: ColorGenerator.getRandomColor(),
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
            ),
          );
        }
      }
    }

    return [
      const VerticalDivider(color: Colors.grey, width: 0),
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
                  (index) => index % 2 == 0
                      ? const Divider(color: Colors.grey, height: 0)
                      : SizedBox(height: boxSize, child: Container()),
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
    int red = random.nextInt(90) + 120; // 120 ~ 210
    int green = random.nextInt(30) + 160; // 160 ~ 190
    int blue = random.nextInt(15) + 240; // 240 ~ 255
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
  Lecture(['토'], [13], [17], '알바'), //요일, 시작, 종료, 이름
  Lecture(['화'], [15], [19], '알바'),
  Lecture(['목'], [12], [21], '알바'),
  Lecture(['화'], [9], [10], '알바'),
  Lecture(['화'], [10], [11], '알바'),
  Lecture(['금'], [10], [16], '알바'),
];
