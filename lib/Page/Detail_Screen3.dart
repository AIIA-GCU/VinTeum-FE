import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/widget/custom_button.dart';
import 'package:vinteum/main.dart';


class DetailScreen3 extends StatelessWidget {
  const DetailScreen3({super.key, required this.userName});
  final String userName;

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: ratio.height * 50,),
              Container(
                height: ratio.height * 700,
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
                      Text( "$userName님의 시간표",
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: ratio.height * 600,
                      ),

                      CustomButton(text: '확인', width: 315,height: 42, func: (){Navigator.pop(context);}, buttonCount: 1)
                    ],

                  ),

                ),
                ),



            ],
          ),
        ),

      ),



    );
  }
}