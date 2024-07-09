import 'package:flutter/material.dart';
import 'package:vinteum/Page/Detail_Screen2.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          leading:IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.chevron_left_sharp),),
          title: Text('그룹명'), //타이틀 -> 폰트 바꾸기
          titleTextStyle: TextStyle(
            fontSize: 30,
              //fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              //눌렸을시 '정말로 삭제하시겠습니까?' 경고문구 팝업후 삭제
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
                icon: Icon(Icons.delete),
            ),
          ],
          ),
        body: Column(
          children: [
            Container(
              //padding: EdgeInsets.all(2.0),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: ElevatedButton.icon(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> DetailScreen2()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ) ,
                        ),
                        icon: Icon(Icons.person),
                        label: Text('4명'), //back에서 인원수 데이터 받아오기
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top:20.0),
                  child: Text('공통 시간',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black38
                    ),
                  ),
                ),
                Image.asset('assets/img/ex_img.png'),
              ],
            ),

          ],

        ),

        ),
      


    );
  }
}
