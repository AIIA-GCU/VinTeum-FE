import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/main.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List week = ['월', '화', '수', '목', '금', '토', '일'];
  final columnLength = 26; //세로 인덱스 길이
  double firstColumnHeight = 20;
  double boxSize = 52;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VinTeumColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Container(
            height: ratio.height * 669,
            decoration: BoxDecoration(
                border: Border.all(color: VinTeumColors.darkgrey),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white),
            child: Row(
              children: [
                buildTimeColumn(),
                ...buildDayColumn(0),
                ...buildDayColumn(1),
                ...buildDayColumn(2),
                ...buildDayColumn(3),
                ...buildDayColumn(4),
                ...buildDayColumn(5),
                ...buildDayColumn(6)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildTimeColumn() {
    //9 to 21 시간
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
                child: Text('${index ~/ 2 + 9}', //9시부터 시작
                    style: TextStyle(fontSize: 10)),
              );
            },
          ),
        ],
      ),
    );
  }

  List<Widget> buildDayColumn(int index) {
    //월-일 요일별
    String currentDay = week[index]; //현재 열의 요일
    List<Widget> lecturesCurrentDay = []; // 현재 요일에 해당 하는 강의

    for (var lecture in selectedLectures) {
      for (int i = 0; i < lecture.day.length; i++) {
        double top = firstColumnHeight +
            (lecture.start[i] - 9) * boxSize; // 강의의 시작 시간에 따라 컨테이너의 위치를 계산
        double height = (lecture.end[i] - lecture.start[i]) *
            boxSize; //강의의 시작 시간과 종료 시간의 차이에 따라 높이를 계산
        if (lecture.day[i] == currentDay) {
          lecturesCurrentDay.add(
            Positioned(
              top: top,
              left: 0,
              child: Stack(children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLectures.remove(lecture);
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: height,
                    decoration: const BoxDecoration(
                      color: VinTeumColors.mainBlue,
                    ),
                    child: Text(
                      "${lecture.lname}",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ]),
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
      '인간관계론' // 강의 이름
      ),
  Lecture(['토', '일'], [12, 12], [21, 21], '알바'),
  Lecture(['목'], [10], [13], '프로그래밍기초'),
];
