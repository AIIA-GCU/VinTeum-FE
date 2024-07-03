import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vinteum/Common/color.dart';
import 'package:image_picker/image_picker.dart';
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("시간표를 등록해주세요!"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 57),
        child: Column(
          children: [
            selected == false ?
            Expanded(
              child: Container(
                color: VinTeumColors.grey2,
                child: Image.asset("assets/img/unselected.png")
              ),
            ):
            Expanded(
              child: Container(
                  child: Image.file(
                    File(image!.path))
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 57),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        backgroundColor: VinTeumColors.primaryColor
                      ),
                      onPressed: () async {
                      await uploadImage(ImageSource.gallery);
                      },
                    child: Text("등록", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: ratio.width * 63),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: VinTeumColors.primaryColor
                    ),
                    onPressed: () {
                      setState(() {
                        selected = false;
                      });
                    },
                    child: Text("삭제", style: TextStyle(color: Colors.white)),
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
