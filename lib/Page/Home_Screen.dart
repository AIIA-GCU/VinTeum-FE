import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/Common/custom_button.dart';
import 'package:vinteum/Common/custom_dialog.dart';
import 'package:vinteum/Page/Alarm_Screen.dart';
import 'package:vinteum/main.dart';
import 'package:vinteum/widget/dialog.dart';
import 'package:vinteum/Page/Setting_Screen.dart';
import 'package:vinteum/widget/Group_List.dart';
import 'package:vinteum/Page/Timetable_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> data = [
      GroupList(title: "그룹1", number: "5"),
      GroupList(title: "그룹1", number: "5"),
      GroupList(title: "그룹1", number: "5"),
    ];
    return Scaffold(
      backgroundColor: VinTeumColors.background,
      body: SafeArea(
        child: Container(
          color: VinTeumColors.background,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Vinteum",
                        style: TextStyle(
                            color: VinTeumColors.darkgrey,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Alarm_Screen()));
                        },
                        child: Icon(
                          Icons.notifications_none,
                          color: VinTeumColors.darkgrey,
                          size: 26,
                        )),
                    SizedBox(width: ratio.width * 15),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingScreen()));
                        },
                        child: Image.asset("assets/img/settings.png",
                            color: VinTeumColors.darkgrey))
                  ],
                ),
                SizedBox(height: ratio.height * 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      children: [
                        Text("아이아님, 반가워요!",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: VinTeumColors.mainBlue)),
                        SizedBox(height: ratio.height * 19),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomButton(
                              text: "시간표 등록하기",
                              func: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TimetableScreen(selected: false)));
                              },
                              buttonCount: 1),
                        )
                      ],
                    ),
                  ),
                ),


                SizedBox(height: ratio.height * 50),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("내 그룹 보기",
                      style:
                          TextStyle(fontSize: 27, color: VinTeumColors.darkgrey, fontWeight: FontWeight.bold)),
                ),
                data.length == 0
                    ? Column(
                        children: [
                          SizedBox(height: ratio.height * 130),
                          Text("그룹을 추가 해주세요!",
                              style: TextStyle(
                                  fontSize: 20, color: VinTeumColors.grey1))
                        ],
                      )
                    : Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return data[index];
                            }),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
