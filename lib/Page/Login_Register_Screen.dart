import 'package:flutter/material.dart';
import 'package:vinteum/widget/custom_button.dart';
import 'package:vinteum/main.dart';
import 'package:vinteum/widget/custom_dialog.dart';

import '../Server/controller.dart'; // LoginRequest 및 loginUser 함수 가져오기

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = false;
  final _formKey = GlobalKey<FormState>();
  String userID = '';
  String userName = '';
  String userPassword = '';
  String userPassword1 = '';
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordVerifyingController =
      TextEditingController();
  final TextEditingController UserIDController = TextEditingController();
  final TextEditingController UserNameController = TextEditingController();

  int _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: ratio.height * 140,
                child: SizedBox(
                    width: ratio.width * 110,
                    height: ratio.height * 100,
                    child: Image.asset('assets/logo/logo.png'))),
            Positioned(
                top: ratio.height * 240,
                child: Text('VinTeum',
                    style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900))),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: ratio.height * 340,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                height: isSignupScreen ? ratio.height * 383 : 250,
                width: ratio.width * 335,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5)
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: ratio.height * 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  '로그인',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: !isSignupScreen
                                          ? Colors.black
                                          : Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  '회원가입',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: isSignupScreen
                                          ? Colors.black
                                          : Colors.grey),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      if (isSignupScreen)
                        Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: ratio.height * 15,
                                ),
                                SizedBox(
                                  width: ratio.width * 300,
                                  child: TextFormField(
                                    controller: UserNameController,
                                    keyboardType: TextInputType.name,
                                    key: ValueKey(1),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '형식에 맞지 않습니다.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      userName = value!;
                                    },
                                    onChanged: (value) {
                                      userName = value;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.drive_file_rename_outline,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      hintText: '이름을 입력해주세요.',
                                      hintStyle: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ratio.height * 20,
                                ),
                                SizedBox(
                                  width: ratio.width * 300,
                                  child: TextFormField(
                                    key: ValueKey(2),
                                    controller: UserIDController,
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 9) {
                                        return '형식에 맞지 않습니다.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      userID = value!;
                                    },
                                    onChanged: (value) {
                                      userID = value;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      hintText: '아이디를 입력해주세요.',
                                      hintStyle: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ratio.height * 20,
                                ),
                                SizedBox(
                                  width: ratio.width * 300,
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: passwordController,
                                    key: ValueKey(3),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 6) {
                                        return '6글자 이상 입력해주세요';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      userPassword = value!;
                                    },
                                    onChanged: (value) {
                                      userPassword = value;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      hintText: '비밀번호를 입력해주세요.',
                                      hintStyle: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ratio.height * 20,
                                ),
                                SizedBox(
                                  width: ratio.width * 300,
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: passwordVerifyingController,
                                    key: ValueKey(4),
                                    validator: (value) {
                                      if (passwordController.text !=
                                          passwordVerifyingController.text) {
                                        return '비밀번호가 다릅니다.';
                                      }
                                      if (passwordVerifyingController.text ==
                                          "") {
                                        return '비밀번호를 입력해주세요.';
                                      }
                                      if (value!.length < 6) {
                                        return '형식에 맞춰 입력 해 주세요';
                                      }
                                    },
                                    onSaved: (value) {
                                      userPassword1 = value!;
                                    },
                                    onChanged: (value) {
                                      userPassword1 = value;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      hintText: '비밀번호를 한번 더 입력해주세요.',
                                      hintStyle: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ratio.height * 13,
                                ),
                                CustomButton(
                                    text: "회원가입",
                                    width: 150,
                                    height: 48,
                                    func: () async {
                                      if (_tryValidation() == 1) {
                                        try {

                                         await RestAPI.tryRegister(
                                              password: passwordController.text,
                                              username: UserIDController.text,
                                              nickname:
                                                  UserNameController.text);

                                         CustomDialog(
                                              context: context,
                                              title: "회원가입 성공!",
                                              dialogContent: "로그인창으로 돌아갑니다.",
                                              buttonText: "확인",
                                              buttonCount: 1,
                                              func: () {
                                                setState(() {
                                                  isSignupScreen = false;
                                                  Navigator.pop(context);
                                                });
                                              });

                                        } catch (e) {
                                          CustomDialog(
                                              context: context,
                                              title: "회원가입에 실패했습니다.",
                                              dialogContent:
                                                  "중복된 아이디입니다. 다시 시도해주세요.",
                                              buttonText: "확인",
                                              buttonCount: 1,
                                              func: () {
                                                setState(() {
                                                  Navigator.pop(context);
                                                });
                                              });
                                        }
                                      }
                                    },
                                    buttonCount: 1),
                              ],
                            ),
                          ),
                        ),
                      if (!isSignupScreen)
                        Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: ratio.height * 15,
                                ),
                                SizedBox(
                                  width: ratio.width * 300,
                                  child: TextFormField(
                                    key: ValueKey(5),
                                    controller: UserIDController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '형식에 맞지 않습니다.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      userID = value!;
                                    },
                                    onChanged: (value) {
                                      userID = value;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      hintText: '아이디를 입력해주세요.',
                                      hintStyle: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ratio.height * 20,
                                ),
                                SizedBox(
                                  width: ratio.width * 300,
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
                                    key: ValueKey(6),
                                    onSaved: (value) {
                                      userPassword = value!;
                                    },
                                    onChanged: (value) {
                                      userPassword = value;
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 6) {
                                        return '형식에 맞지 않습니다.';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      hintText: '비밀번호를 입력해주세요',
                                      hintStyle: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                      contentPadding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ratio.height * 16,
                                ),
                                CustomButton(
                                    text: "로그인",
                                    width: 150,
                                    height: 48,
                                    func: () async {
                                      if(_tryValidation() == 1)  {
                                        try {
                                          await RestAPI.signIn(userId: UserIDController.text, pw: passwordController.text);
                                        } catch (e) {
                                          CustomDialog(
                                              context: context,
                                              title: "로그인에 실패하였습니다.",
                                              dialogContent:
                                              "유효한 아이디 혹은 비밀번호를 입력하세요.",
                                              buttonText: "확인",
                                              buttonCount: 1,
                                              func: () {
                                                setState(() {
                                                  Navigator.pop(context);
                                                });
                                              });
                                        }
                                      }
                                    },
                                    buttonCount: 1),
                              ],
                            ),
                          ),
                        )
                    ],
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
