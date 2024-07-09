import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/main.dart';
import 'package:vinteum/widget/dialog.dart';
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
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.notifications_none),
                  SizedBox(width: ratio.width * 15),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return settingDialog();
                          },
                        );
                      },
                      child: Image.asset("assets/img/settings.png"))
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/img/account_circle.png"),
                    SizedBox(width: ratio.width * 6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: ratio.width * 6,
                              ),
                              Text("사용자",
                                  style: TextStyle(
                                    fontSize: 27,
                                  )),
                            ],
                          ),
                          Divider(
                              height: 5,
                              thickness: 1,
                              indent: 3,
                              endIndent: 3,
                              color: Colors.black)
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return nameDialog();
                            },
                          );
                        },
                        child: Image.asset("assets/img/edit.png"))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                    ).copyWith(
                      overlayColor: MaterialStateProperty.all(Colors.transparent), // 클릭 효과 제거
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TimetableScreen(selected: false)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.folder_outlined),
                        SizedBox(width: ratio.width * 12),
                        Text("시간표 관리"),
                      ],
                    )),
              ),
              SizedBox(height: ratio.height * 53),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text("내 그룹 보기",
                    style: TextStyle(fontSize: 32, color: VinTeumColors.grey1)),
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
    );
  }
}
