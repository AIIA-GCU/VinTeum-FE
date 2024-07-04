import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/config/variable.dart';
import 'package:vinteum/Page/Detail_Screen2.dart';


class DetailScreen3 extends StatelessWidget {
  const DetailScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          leading:IconButton(onPressed: (){
            Navigator.pop(context);
          },
            icon: Icon(Icons.chevron_left_sharp),),
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
              height: 600,
              width: 350,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  border: Border.all(width: 2), 
                  borderRadius: BorderRadius.circular(17.0)
                ),
              child: Center(
                child: Column(
                  children: [
                    Text( "ooo님의 시간표",
                      style: TextStyle(fontSize: 20),
                    ),
                    Image.asset('assets/images/ex_img.png'),
                    SizedBox(height: 9),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text('확인')),
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