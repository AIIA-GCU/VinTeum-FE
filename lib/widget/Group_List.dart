import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/main.dart';
import 'package:vinteum/Page/Detail_Screen1.dart';


class GroupList extends StatelessWidget {
  final String title;
  final int number;
  const GroupList({
    required this.title,
    required this.number,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                DetailScreen(number: number),
          ));
        },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 17, 0, 0),
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    title,
                    style: TextStyle(
                        fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold)
                ),
                SizedBox(height: ratio.height * 7),
                Row(
                  children: [
                    Icon(Icons.person, size: 30),
                    Text(
                        "$number명",
                        style: TextStyle(
                            fontSize: 20, color: Colors.black)
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            Image.asset("assets/img/navigation.png")
          ],
        ),

      ),
    );
  }
}
