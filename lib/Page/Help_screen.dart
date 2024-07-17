import 'package:flutter/material.dart';
import 'package:vinteum/Common/color.dart';
import 'package:vinteum/main.dart';
import 'package:vinteum/widget/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vinteum/widget/root_tab.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  final help1_title = "시간표의 빈틈을 찾아드려요!";
  final help1_content = "메인페이지 내 시간표 등록 버튼을 통해 시간표를 관리하세요.";
  final help1_subContent = "에브리타임 > 시간표 > 설정 > 이미지로 저장 후 "
      "              시간표를 등록할 수 있습니다.";

  final help2_title = "시간표의 종류에 따라 등록하세요!";
  final help2_content = "자신의 시간표 종류를 선택 후 시간표 이미지를 등록하세요.";
  final help2_subContent = "정규 시간표 : 주말이 포함되지 않은 시간표"
      "                     커스텀 시간표 : 주말이 포함된 시간표";

  final help3_title = "등록된 시간표는 수정이 가능해요!";
  final help3_content = "시간표에서 원하는 일정을 등록해보세요.";
  final help3_subContent = "도움말은 설정 페이지에서 다시 확인할 수 있습니다.";

  static const title = TextStyle(fontSize: 27, fontWeight: FontWeight.bold);
  static const content = TextStyle(fontSize: 23, color: VinTeumColors.darkgrey);
  static const subContent = TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: VinTeumColors.mainBlue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VinTeumColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                children: [
                  SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(help1_title, style: title),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: ratio.height * 30),
                              Image.asset("assets/img/help1.png"),
                              SizedBox(height: ratio.height * 30),
                              Text(help1_content,
                                  style: content, textAlign: TextAlign.center),
                              SizedBox(height: ratio.height * 30),
                              Text(help1_subContent,
                                  style: subContent,
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(help2_title, style: title),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: ratio.height * 30),
                              Image.asset("assets/img/help2.png"),
                              SizedBox(height: ratio.height * 30),
                              Text(help2_content,
                                  style: content, textAlign: TextAlign.center),
                              SizedBox(height: ratio.height * 30),
                              Text(help2_subContent,
                                  style: subContent,
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text(help3_title, style: title),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              SizedBox(height: ratio.height * 40),
                              Image.asset("assets/img/help2.png"),
                              SizedBox(height: ratio.height * 45),
                              Text(help3_content,
                                  style: content, textAlign: TextAlign.center),
                              SizedBox(height: ratio.height * 5),
                              Text(help3_subContent,
                                  style: subContent,
                                  textAlign: TextAlign.center),
                              SizedBox(height: ratio.height * 60),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
                controller: pageController, //// PageController
                count: 3,
                effect: WormEffect(
                    dotColor: VinTeumColors.grey2,
                    activeDotColor: VinTeumColors.mainBlue,
                    dotHeight: 10,
                    dotWidth: 10),
                onDotClicked: (index) {}),
            currentPageIndex == 2
                ? Column(
                    children: [
                      SizedBox(height: ratio.height * 30),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RootTab()));
                          },
                          child: Text("이 페이지를 다시 표시하지 않음",
                              style: TextStyle(color: VinTeumColors.grey3))),
                      SizedBox(height: ratio.height * 5),
                      CustomButton(
                        width: 370,
                        height: 48,
                        text: "확인",
                        func: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RootTab()));
                        },
                        buttonCount: 1,
                      ),
                    ],
                  ) :
                SizedBox(height: ratio.height * 40)
                // : SizedBox(height: ratio.height * 102),
          ],
        ),
      ),
    );
  }
}
