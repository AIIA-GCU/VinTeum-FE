import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/Common/dialog.dart';
import 'package:vinteum/Page/Group_List.dart';
import 'package:vinteum/Page/Timetable_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _nameController = TextEditingController(text: "사용자");

  @override
  Widget build(BuildContext context) {
    List<Widget> data = [
      // GroupList(title: "그룹1", number: "5"),
      // GroupList(title: "그룹2", number: "1"),
      // GroupList(title: "그룹3", number: "3"),
      // GroupList(title: "그룹4", number: "2"),
      // GroupList(title: "그룹5", number: "2"),
      // GroupList(title: "그룹6", number: "4"),
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
                  SizedBox(width: 15),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return settingDialog();
                        },
                      );
                    },
                      child: Image.asset("Assets/img/settings.png")
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("Assets/img/profile.png"),
                    SizedBox(width: 12),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: _nameController,
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {}, child: Image.asset("Assets/img/edit.png"))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimetableScreen(selected: false)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.folder_outlined),
                        SizedBox(width: 12),
                        Text("시간표 관리")
                      ],
                    )),
              ),
              SizedBox(height: 53),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text("내 그룹 보기",
                    style: TextStyle(fontSize: 32, color: VinTeumColors.grey1)),
              ),
              data.length == 0
                  ? Column(
                      children: [
                        SizedBox(height: 130),
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
