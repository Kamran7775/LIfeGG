import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

import 'health_result_view.dart';

class HealtApp extends StatefulWidget {
  const HealtApp({Key? key}) : super(key: key);

  @override
  State<HealtApp> createState() => _HealtAppState();
}

class _HealtAppState extends State<HealtApp> {
  String woman = 'Woman';
  String guy = 'Boy';
  String text1 = 'How many cigarettes do you smoke per day ?';
  String text2 = 'How many times do you exercise per week ?';
  String height = 'Height';
  String weight = 'Weight';
  String title = 'How long will you live ?';
  String gender = 'Gender';
  double cigaraCount = 0;
  double sportCount = 0;
  double numKg = 65;
  double numBoy = 165;
  bool _isLoding = false;
  plusMinus(bool counter) {
    if (counter) {
      setState(() {
        numBoy++;
      });
    } else {
      setState(() {
        numBoy--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: CustomContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Text(
                      text1,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.black54,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ),
                  Text(
                    cigaraCount.round().toString(),
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.pinkAccent, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Slider(
                      activeColor: Colors.pink,
                      value: cigaraCount,
                      onChanged: (double value) {
                        setState(() {
                          cigaraCount = value;
                        });
                      },
                      label: cigaraCount.round().toString(),
                      min: 0,
                      max: 50,
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: CustomContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Text(
                      text2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.black54,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ),
                  Text(
                    sportCount.round().toString(),
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.pinkAccent, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w),
                    child: Slider(
                        activeColor: Colors.pink,
                        label: sportCount.round().toString(),
                        min: 0,
                        max: 7,
                        divisions: 7,
                        value: sportCount,
                        onChanged: (value) {
                          setState(() {
                            sportCount = value;
                          });
                        }),
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: CustomContainer(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(width: 20.h),
                        RotatedBox(
                          quarterTurns: -1,
                          child: Text(height,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                  )),
                        ),
                        SizedBox(width: 10.w),
                        RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            numBoy.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(width: 30.w),
                        RotatedBox(
                            quarterTurns: -1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    plusMinus(false);
                                  },
                                  child: Container(
                                    width: 40.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image:
                                                AssetImage('assets/minus.png')),
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black)),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    plusMinus(true);
                                  },
                                  child: Container(
                                    width: 40.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image:
                                                AssetImage('assets/plus.jpg')),
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black)),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )),
                  Expanded(
                      child: CustomContainer(
                    child: Row(
                      children: [
                        SizedBox(width: 20.w),
                        RotatedBox(
                          quarterTurns: -1,
                          child: Text(weight,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                  )),
                        ),
                        SizedBox(width: 10.w),
                        RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            numKg.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(width: 30.w),
                        RotatedBox(
                            quarterTurns: -1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      numKg--;
                                    });
                                  },
                                  child: Container(
                                    width: 40.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage('assets/minus.png'),
                                        ),
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black)),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      numKg++;
                                    });
                                  },
                                  child: Container(
                                    width: 40.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image:
                                                AssetImage('assets/plus.jpg')),
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black)),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: CustomContainer(
                    reng: gender == guy ? Colors.lightBlue[100] : Colors.white,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          gender = guy;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Lottie.asset('assets/boy.json',
                              width: 100.w, height: 100.h),
                          Text(
                            guy,
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic,
                                    ),
                          )
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: CustomContainer(
                    reng:
                        gender == woman ? Colors.lightBlue[100] : Colors.white,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          gender = woman;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Lottie.asset('assets/woman.json',
                              width: 100.w, height: 100.h),
                          Text(
                            woman,
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic,
                                    ),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
            _isLoding == false
                ? ElevatedButton.icon(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      setState(() {
                        _isLoding = true;
                      });

                      Timer(const Duration(seconds: 2), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Result(
                                      user: UserData(
                                          numBoy: numBoy,
                                          numKg: numKg,
                                          gender: gender,
                                          cigaraCount: cigaraCount,
                                          sportCount: sportCount),
                                    )));
                        setState(() {
                          _isLoding = false;
                        });
                      });
                    },
                    icon: const Icon(
                      Icons.published_with_changes_rounded,
                      color: Colors.black,
                    ),
                    label: SizedBox(
                      width: 120.w,
                      child: Center(
                        child: Text('Calculate',
                            style:
                                Theme.of(context).textTheme.headline5?.copyWith(
                                      color: Colors.black87,
                                    )),
                      ),
                    ))
                : const SpinKitThreeInOut(
                    size: 40,
                    color: Colors.white,
                  )
          ],
        ),
      ),
    );
  }
}

class UserData {
  String? gender;
  double? cigaraCount;
  double? sportCount;
  double? numKg;
  double? numBoy;
  UserData(
      {this.gender,
      this.numBoy,
      this.numKg,
      this.cigaraCount,
      this.sportCount});
}

class DurationItem {
  static Duration lowDuration = const Duration(seconds: 3);
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    this.onPress,
    this.child,
    this.reng = Colors.white,
    Key? key,
  }) : super(key: key);
  final Color? reng;
  final Widget? child;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.w),
      decoration:
          BoxDecoration(color: reng, borderRadius: BorderRadius.circular(15.r)),
      child: child,
    );
  }
}
