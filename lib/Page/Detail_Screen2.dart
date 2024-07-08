import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinteum/Page/Detail_Screen3.dart';


class DetailScreen2 extends StatelessWidget {
  const DetailScreen2({super.key});

  @override
  Widget build(BuildContext context) {

    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          leading:IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.chevron_left_sharp),),
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
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 30.0),
                  Text('방장',
                  style: TextStyle(fontSize: 18.0),),
                ],
              ),
            ),
            Container(
              height: 50,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> DetailScreen3()),
                );
              },
              child: Container(
                height: 55,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: Colors.black
                  ),
                ),
                child: Row(
                  children: [
                    // 사람 아이콘 눌러서 시간표 확인

                    Icon(Icons.person),


                    SizedBox(width: 30.0),
                    Text('ooo',
                      style: TextStyle(fontSize: 18.0),),
                    SizedBox(width: 210.0),
                    // 'X'아이콘 눌러서 그룹원 삭제기능
                    IconButton(onPressed: (){
                      showDialog(context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('정말로 삭제하시겠습니까?'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('예'), // 누르면 홈화면으로 돌아간후 그룹 정보를 삭제시키기
                                onPressed: (){
                                  Navigator.of(context).pop(); // 팝업 창 닫기
                                  Navigator.of(context).pop(); // 현재 페이지 닫기
                                },
                              ),
                              TextButton(
                                child: Text('아니요'),  // 팝업창만 닫히고 그대로 유지
                                onPressed: (){
                                  Navigator.of(context).pop(); // 팝업 창 닫기
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.close),
                    ),
                  ],

                ),
              ),
            ),
            Container(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> DetailScreen3()),
                );
              },
              child: Container(
                height: 55,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: Colors.black
                  ),
                ),
                child: Row(
                  children: [
                    // 사람 아이콘 눌러서 시간표 확인
                    Icon(Icons.person),


                    SizedBox(width: 30.0),
                    Text('xxx',
                      style: TextStyle(fontSize: 18.0),),
                    SizedBox(width: 210.0),
                    // 'X'아이콘 눌러서 그룹원 삭제기능
                    IconButton(onPressed: (){
                      showDialog(context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('정말로 삭제하시겠습니까?'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('예'), // 누르면 홈화면으로 돌아간후 그룹 정보를 삭제시키기
                                onPressed: (){
                                  Navigator.of(context).pop(); // 팝업 창 닫기
                                  Navigator.of(context).pop(); // 현재 페이지 닫기
                                },
                              ),
                              TextButton(
                                child: Text('아니요'),  // 팝업창만 닫히고 그대로 유지
                                onPressed: (){
                                  Navigator.of(context).pop(); // 팝업 창 닫기
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                      icon: Icon(Icons.close),
                    ),
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