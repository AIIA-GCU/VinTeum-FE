import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/Page/Detail_Screen2.dart';
import 'package:vinteum/main.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        backgroundColor: VinTeumColors.background,
        appBar: AppBar(
          leading:IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.chevron_left_sharp,
            color: VinTeumColors.grey,
          ),
          ),
          title: Text('그룹명'), //타이틀 -> 폰트 바꾸기
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
          centerTitle: true,
          backgroundColor: VinTeumColors.background,
        ),
        body: Column(
          children: [
                SizedBox(height: ratio.height * 20),
                Row(
                  children: [
                    SizedBox(width: ratio.width * 30,),
                    Container(
                      child: Text('공통 시간',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: VinTeumColors.mainBlue
                        ),
                      ),
                    ),
                    SizedBox(width: ratio.width * 100),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> DetailScreen2()),
                        );
                      },
                      child: Container(
                        width: ratio.width * 144,
                        height: ratio.height * 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          border: Border.all(
                            color: VinTeumColors.darkgrey
                          ),
                        ),
                        child: Center(child: Text(
                            '그룹 인원: 2명',
                          style: TextStyle(
                            fontSize: 16,
                            color: VinTeumColors.darkgrey,
                          ),
                        ),
                        ),


                      ),
                    ),


                // Image.asset(
                //   'assets/img/ex_img.png',
                //   width: ratio.width * 319,
                //   height: ratio.height * 518,
                //   fit: BoxFit.cover,
                // ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: ratio.height * 527,
              width: ratio.width * 357,
              decoration: BoxDecoration(
                color: Colors.white
              ),


            ),
            SizedBox(
              height: ratio.height * 30,
            ),
            GestureDetector(
              onTap: (){
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
              child: Container(
                width: ratio.width * 315,
                height: ratio.height * 42,

                decoration: BoxDecoration(
                  color: VinTeumColors.mainBlue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    '그룹 삭제',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),

                  ),
                ),

              ),
            ),


          ],

        ),

      ),



    );
  }
}
