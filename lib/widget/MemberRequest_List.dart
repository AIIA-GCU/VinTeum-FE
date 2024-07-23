import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/widget/custom_dialog.dart';
import 'package:vinteum/Page/Detail_Screen3.dart';
import 'package:vinteum/main.dart';



class MemberRequest extends StatelessWidget {
  const MemberRequest({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => DetailScreen3(userName: userName),
        ));
      },
      child: Container(
        height: ratio.height * 55,
        child: Row(
          children: [
            SizedBox(width: ratio.width * 15),
            Image.asset("assets/img/icon.png"),
            SizedBox(width: ratio.width * 30.0),
            Container(
              child: Text(
                userName,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Spacer(),
            IconButton(onPressed: (){
              CustomDialog(context: context,
                  title: "가입 수락",
                  dialogContent: "해당 맴버를 수락 하시겠습니까?",
                  buttonText: " ",
                  buttonCount: 2,
                  func: (){});
            }, icon: Icon(
              Icons.check,
              color: VinTeumColors.mainBlue,
             ),
            ),
//  'X'아이콘 눌러서 그룹원 삭제기능
            IconButton(
              onPressed: () {
                CustomDialog(
                    context: context,
                    title: "가입 거절",
                    dialogContent: '해당 맴버를 거절 하시겠습니까?',
                    buttonText: " ",
                    buttonCount: 2,
                    func: () {});
              },
              icon: Icon(
                Icons.close,
                color: VinTeumColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
