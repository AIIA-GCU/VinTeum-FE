import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/config/variable.dart';

class DetailScreen2 extends StatelessWidget {
  const DetailScreen2({super.key});

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
              height: 50,
            ),
            Container(
              height: 55,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black
                ),
              ),
            ),
            Container(
              height: 50,
            ),
            Container(
              height: 55,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.black
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            Container(
              height: 55,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.black
                ),
              ),
            ),


         ],
        ),

      ),



    );
  }
}