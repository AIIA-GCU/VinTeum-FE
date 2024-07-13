import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/Common/custom_dialog.dart';
import 'package:vinteum/Page/Detail_Screen3.dart';
import 'package:vinteum/main.dart';



class MemberList extends StatelessWidget {
  const MemberList({super.key, required this.userName});
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
//  'X'아이콘 눌러서 그룹원 삭제기능
            IconButton(
              onPressed: () {
                CustomDialog(
                    context: context,
                    title: "맴버 삭제",
                    dialogContent: '맴버를 삭제하시겠습니까?',
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



