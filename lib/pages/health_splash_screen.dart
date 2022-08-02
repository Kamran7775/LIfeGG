import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:life_gg/pages/health_home_view.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final String _text = "#Let's protect our health";
  double opasity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HealtApp()));
    });

    Future.microtask(() {
      setState(() {
        opasity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink,
        body: Column(
          children: [
            Expanded(
              flex: 9,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Lottie.asset(
                      'assets/healt.json',
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  AnimatedOpacity(
                    opacity: opasity,
                    duration: DurationItem.lowDuration,
                    child: Text(
                      _text,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400),
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

class DurationItem {
  static Duration lowDuration = const Duration(seconds: 2);
}
