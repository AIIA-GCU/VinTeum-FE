import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';

class Alarm_Screen extends StatelessWidget {
  const Alarm_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: VinTeumColors.grey1,)),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('아직 알람이 없어요!', style: TextStyle(color: VinTeumColors.grey1, fontSize: 16),)
          ],
        ),
      ),
    );
  }
}
