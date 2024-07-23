import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vinteum/Common/color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vinteum/widget/custom_button.dart';
import 'package:vinteum/widget/custom_dialog.dart';
import 'package:vinteum/main.dart';
import 'package:vinteum/widget/time_table.dart';

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
  String? filePath;

  bool isRegular = true;
  bool isCustom = false;
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [isRegular, isCustom];
    super.initState();
  }

  Future<void> uploadImage(ImageSource gallery) async {
    setState(() => loading = true);
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        fileName = pickedFile.name;
        filePath = pickedFile.path;
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
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: VinTeumColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("시간표 등록",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        actions: [
          Container(
            width: ratio.width * 75,
            height: ratio.height * 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              border: Border.all(color: VinTeumColors.darkgrey),
            ),
            child: GestureDetector(
              onTap: () {
                CustomDialog(
                    context: context,
                    title: "시간표 등록",
                    dialogContent: "시간표를 삭제하시겠습니까?",
                    buttonText: "",
                    buttonCount: 2,
                    func: () {
                      setState(() {
                        selected = false;
                        Navigator.pop(context);
                      });
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.refresh,
                      color: VinTeumColors.grey3, size: 19),
                  SizedBox(width: ratio.width * 3),
                  Text(
                    '초기화',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: VinTeumColors.grey3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: ratio.width * 16,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: ratio.height * 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selected == false)
              Container(
                height: ratio.height * 33,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: ToggleButtons(
                    disabledColor: Colors.white,
                    renderBorder: true,
                    borderRadius: BorderRadius.circular(6),
                    borderWidth: 1,
                    borderColor: VinTeumColors.mainBlue,
                    selectedBorderColor: VinTeumColors.mainBlue,
                    fillColor: VinTeumColors.mainBlue,
                    color: VinTeumColors.mainBlue,
                    selectedColor: Colors.white,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Text("정규",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Text("커스텀",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    ],
                    isSelected: isSelected,
                    onPressed: toggleSelect),
              ),
            ],
          ),
          selected == false
              ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(

                  width: ratio.width * 358,
                  height: ratio.height * 550,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: ratio.height * 20),
                      isRegular == true
                          ? Center(
                              child: Text("정규 시간표를 등록 해주세요.",
                                  style: TextStyle(
                                      color: VinTeumColors.darkgrey,
                                      fontSize: 20)))
                          : Center(
                              child: Text("커스텀 시간표를 등록 해주세요.",
                                  style: TextStyle(
                                      color: VinTeumColors.darkgrey,
                                      fontSize: 20))),
                    ],
                  ),
                ),
              )
              : Column(
                children: [
                  SizedBox(
                    height: ratio.height * 15.57,
                  ),
                  Container(
                    width: ratio.width * 358,
                    height: ratio.height * 550,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: TimeTable(),
                    ),
                  ),
                ],
              ),
          if (selected == false)
          Column(
            children: [
              SizedBox(
                height: ratio.height * 29,
              ),
              CustomButton(
                width: 370,
                height: 48,
                text: "등록",
                func: () async {
                  await uploadImage(ImageSource.gallery);
                },
                buttonCount: 1,
              ),
            ],
          )
        ],
      ),
    );
  }

  void toggleSelect(value) {
    if (value == 0) {
      isRegular = true;
      isCustom = false;
    } else {
      isRegular = false;
      isCustom = true;
    }
    setState(() {
      isSelected = [isRegular, isCustom];
    });
  }
}
