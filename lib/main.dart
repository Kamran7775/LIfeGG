import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_gg/pages/health_splash_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, widget) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Life Test',
              theme: ThemeData(
                  appBarTheme: AppBarTheme(
                      centerTitle: true,
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30.r),
                      )),
                      elevation: 0,
                      titleTextStyle: const TextStyle(color: Colors.white)),
                  scaffoldBackgroundColor: Colors.pink,
                  primaryColor: Colors.pink),
              home: const SplashScreen(),
            ),
        designSize: const Size(375, 812));
  }
}
