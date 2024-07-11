import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/main.dart';
import 'package:vinteum/Page/Detail_Screen3.dart';


class DetailScreen2 extends StatelessWidget {
  const DetailScreen2({super.key});

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
          centerTitle: true,
          backgroundColor: VinTeumColors.background,
        ),
        body: Column(
          children: [
            Container(
              height: ratio.height * 50,
            ),
            Container(
              height: ratio.height * 119,
              width: ratio.width * 358,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ratio.height * 20,),
                  Row(
                    children: [
                      SizedBox(width: ratio.width * 20,),
                      Image.asset('assets/img/crown.png'),
                      SizedBox(width: ratio.width * 10.0),
                      Text('방장',
                      style: TextStyle(fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: ratio.height * 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("000님",
                      style: TextStyle(
                        color: VinTeumColors.mainBlue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: ratio.height * 35,),

            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text("맴버",
                  style: TextStyle(
                    color: VinTeumColors.darkgrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),

            SizedBox(height: ratio.height * 10,),

            Container(
              height: ratio.height * 427,
              width: ratio.width * 358,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child:
                Column(
                  children: [
                    SizedBox(height: ratio.height * 15,),
                    Container(
                      height: ratio.height * 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> DetailScreen3()),
                        );
                      },
                      child: Container(
                        height: ratio.height * 55,
                        width: ratio.width * 330,

                        child: Row(
                          children: [
                            SizedBox(width: ratio.width * 5),
                            Image.asset("assets/img/icon.png"),
                            SizedBox(width: ratio.width * 30.0),
                            Container(
                              child: Flexible(
                                child: Text('000님',
                                  style: TextStyle(fontSize: 18.0),),
                              ),
                              width: ratio.width * 150,
                            ),
                            SizedBox(width: ratio.width * 70.0),
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
                              icon: Icon(Icons.close,
                                color: VinTeumColors.grey,
                              ),
                            ),
                          ],

                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> DetailScreen3()),
                        );
                      },
                      child: Container(
                        height: ratio.height * 55,
                        width: ratio.width * 330,

                        child: Row(
                          children: [
                            SizedBox(width: ratio.width * 5),
                            Image.asset("assets/img/icon.png"),
                            SizedBox(width: ratio.width * 30.0),
                            Container(
                              child: Flexible(
                                child: Text('000님',
                                  style: TextStyle(fontSize: 18.0),),
                              ),
                              width: ratio.width * 150,
                            ),
                            SizedBox(width: ratio.width * 70.0),
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
                              icon: Icon(Icons.close,
                                color: VinTeumColors.grey,
                              ),
                            ),
                          ],

                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> DetailScreen3()),
                        );
                      },
                      child: Container(
                        height: ratio.height * 55,
                        width: ratio.width * 330,

                        child: Row(
                          children: [
                            SizedBox(width: ratio.width * 5),
                            Image.asset("assets/img/icon.png"),
                            SizedBox(width: ratio.width * 30.0),
                            Container(
                              child: Flexible(
                                child: Text('000님',
                                  style: TextStyle(fontSize: 18.0),),
                              ),
                              width: ratio.width * 150,
                            ),
                            SizedBox(width: ratio.width * 70.0),
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
                              icon: Icon(Icons.close,
                                color: VinTeumColors.grey,
                              ),
                            ),
                          ],

                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> DetailScreen3()),
                        );
                      },
                      child: Container(
                        height: ratio.height * 55,
                        width: ratio.width * 330,

                        child: Row(
                          children: [
                            SizedBox(width: ratio.width * 5),
                            Image.asset("assets/img/icon.png"),
                            SizedBox(width: ratio.width * 30.0),
                            Container(
                              child: Flexible(
                                child: Text('000님',
                                  style: TextStyle(fontSize: 18.0),),
                              ),
                              width: ratio.width * 150,
                            ),
                            SizedBox(width: ratio.width * 70.0),
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
                              icon: Icon(Icons.close,
                                color: VinTeumColors.grey,
                              ),
                            ),
                          ],

                        ),
                      ),
                    ),

                  ],
                ),
              ),





         ],
        ),

      ),



    );
  }
}