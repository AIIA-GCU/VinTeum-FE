import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vinteum/Common/color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vinteum/Common/custom_button.dart';
import 'package:vinteum/Common/custom_dialog.dart';
import 'package:vinteum/main.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key, required this.selected});

  final bool selected;

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  final picker = ImagePicker();
  XFile? image;
  bool selected = false;
  bool loading = false;
  String imageName = "unselected";
  String? fileName;

  @override
  void initState() {
    super.initState();
  }

  Future<void> uploadImage(ImageSource gallery) async {
    setState(() => loading = true);
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        fileName = pickedFile.name;
        image = pickedFile;
        selected = true;
      }
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VinTeumColors.background,
      appBar: AppBar(
        backgroundColor: VinTeumColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("시간표 등록",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            selected == false
                ? Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text("시간표를 등록 해주세요.", style: TextStyle(
                    color: VinTeumColors.darkgrey, fontSize: 20))),
              ),
            )
                : Expanded(
              child: Container(child: Image.file(File(image!.path))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        CustomDialog(context: context,
                            title: "시간표 등록",
                            dialogContent: "시간표를 삭제하시겠습니까?",
                            buttonText: "",
                            buttonCount: 2,
                            func: (){
                              setState(() {
                                selected = false;
                                Navigator.pop(context);
                            });

                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: VinTeumColors.subBlue2,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "삭제",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: VinTeumColors.mainBlue,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(width: ratio.width * 30),

                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        await uploadImage(ImageSource.gallery);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: VinTeumColors.mainBlue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "등록",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
