import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/Common/custom_button.dart';
import 'package:vinteum/main.dart';


class DetailScreen3 extends StatelessWidget {
  const DetailScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: VinTeumColors.background,
        appBar: AppBar(
          leading:IconButton(onPressed: (){
            Navigator.pop(context);
          },
            icon: Icon(
              Icons.arrow_back_ios,
              color: VinTeumColors.grey,
            ),),
          title: Text('그룹명',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ), //타이틀 -> 폰트 바꾸기
          titleTextStyle: TextStyle(
              fontSize: 30,
              //fontWeight: FontWeight.bold,
              color: Colors.black
          ),
          centerTitle: true,
          backgroundColor: VinTeumColors.background,
        ),
        body: Column(
          children: [
            Container(
              height: ratio.height * 700,
              width: ratio.width * 350,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,

                  borderRadius: BorderRadius.circular(17.0)
                ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: ratio.height * 10,
                    ),
                    Text( "그룹원1님의 시간표",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: ratio.height * 21,
                    ),

                    SizedBox(height: ratio.height * 500),

                    CustomButton(text: '확인', func: (){}, buttonCount: 1)
                  ],

                ),

              ),
              ),



          ],
        ),

      ),



    );
  }
}