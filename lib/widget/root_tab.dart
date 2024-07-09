import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinteum/Page/Home_Screen.dart';
import 'package:vinteum/Page/Make_Screen.dart';
import 'package:vinteum/Page/Search_Screen.dart';
import 'package:vinteum/Common/color.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(tabListner);
  }

  @override
  void dispose() {
    controller.removeListener(tabListner);
    super.dispose();
  }

  void tabListner(){
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HomeScreen(),
            MakeScreen(selected: false),
            SearchScreen()
          ]
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: VinTeumColors.mainBlue,
          unselectedItemColor: VinTeumColors.darkgrey,
          backgroundColor: Colors.white,
          selectedFontSize: 0,
          selectedLabelStyle: TextStyle(color: Colors.black),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (int index){
            controller.animateTo(index);
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home,size: 30), label: '홈'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.plus_circle,size: 30), label: '그룹 생성'),
            BottomNavigationBarItem(icon: Icon(Icons.search,size: 30), label: '그룹 참여'),
          ]
      ),
    );
  }
}