import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/config/variable.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          leading:IconButton(onPressed: (){}, icon: Icon(Icons.chevron_left_sharp),),
          title: Text('개쩌는 그룹명'), //타이틀 -> 폰트 바꾸기
          titleTextStyle: TextStyle(
              fontSize: 30,
              //fontWeight: FontWeight.bold,
              color: Colors.black
          ),
          centerTitle: true,

        ),
        body: Column(
          children: [
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){},icon: Icon(Icons.person),),
                  Text('data     '), //back에서 인원수 데이터 받아오기
                ],
              ),
            ),
            Container(
              height:  30,
              child: Text('공통으로 비는 시간',
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            Container(
              // height: ratio.height * 100,
              // weight: ratio.weight * 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/ex_img.png')
                ),
              ),

            ),
          ],

        ),

      ),



    );
  }
}