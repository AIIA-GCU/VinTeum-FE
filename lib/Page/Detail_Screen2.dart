import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/widget/custom_dialog.dart';
import 'package:vinteum/main.dart';
import 'package:vinteum/Page/Detail_Screen3.dart';
import 'package:vinteum/widget/Member_List.dart';
import 'package:vinteum/widget/MemberRequest_List.dart';

class DetailScreen2 extends StatelessWidget {
  const DetailScreen2({super.key});


  @override
  Widget build(BuildContext context) {
    List<Widget> memberData = [
      MemberList(userName: "000"),
      MemberList(userName: "아이아"),
      MemberList(userName: "아이아"),
      MemberList(userName: "000"),
      MemberList(userName: "아이아"),
    ];
    List<Widget> memberrequest  = [
      MemberRequest(userName: '000'),
      MemberRequest(userName: 'XXX')
    ];
    return Placeholder(
      child: Scaffold(
        backgroundColor: VinTeumColors.background,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: VinTeumColors.grey,
            ),
          ),
          title: Text(
            '그룹명',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ), //타이틀 -> 폰트 바꾸기
          centerTitle: true,
          backgroundColor: VinTeumColors.background,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: ratio.height * 50,
              ),
              Container(
                height: ratio.height * 119,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ratio.height * 25,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: ratio.width * 20,
                        ),
                        Image.asset('assets/img/crown.png'),
                        SizedBox(width: ratio.width * 10.0),
                        Text(
                          '방장',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ratio.height * 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "000님",
                        style: TextStyle(
                            color: VinTeumColors.mainBlue,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ratio.height * 35,
              ),
              // 맴버
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "멤버",
                    style: TextStyle(
                        color: VinTeumColors.darkgrey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: ratio.height * 10,
              ),
              Container(
                height: ratio.height * 427,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: memberData.length,
                      itemBuilder: (context, index) {
                        return memberData[index];
                      }),
                ),
              ),
              SizedBox(height: ratio.height * 35,),

              //가입 요청
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "가입 요청",
                    style: TextStyle(
                        color: VinTeumColors.darkgrey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: ratio.height * 10,
              ),
              Container(
                height: ratio.height * 227,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                        itemCount: memberrequest.length,
                      itemBuilder: (context, index) {
                        return memberrequest[index];
                      }),
                ),
              ),
              SizedBox(height: ratio.height * 50,)
            ],
          ),
        ),
      ),
    );
  }
}
