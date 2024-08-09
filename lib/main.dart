import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Page/splash_Screen.dart';
import 'Server/provider.dart';
import 'Server/session.dart';
import 'Server/user_dto.dart';
late Size ratio;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    ratio = Size(MediaQuery.sizeOf(context).width / 412, MediaQuery.sizeOf(context).height / 892);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => RegisterProvider()),
          ChangeNotifierProvider(create: (_) => SessionProvider()),
          ChangeNotifierProvider(create: (_) => UserDTO()),
        ],
        child: MaterialApp(
        theme: ThemeData(
            fontFamily: "Pretendard",
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),

        debugShowCheckedModeBanner: false,
        home: SplashScreen()
        )
    );
  }
}
