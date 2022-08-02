import 'package:flutter/material.dart';
import 'package:life_gg/pages/health_home_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Result extends StatefulWidget {
  const Result({Key? key, required this.user}) : super(key: key);
  final UserData user;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_backspace_outlined),
            iconSize: 30,
            color: Colors.white,
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Life Expectancy",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white),
          )),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: "Gender: ${widget.user.gender}"),
            SizedBox(height: 10.h),
            CustomText(
                text: "Weekly sports: ${widget.user.sportCount!.round()}"),
            SizedBox(height: 10.h),
            CustomText(
                text:
                    "Number of cigarettes: ${widget.user.cigaraCount!.round()}"),
            SizedBox(height: 10.h),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(text: "Height: ${widget.user.numBoy}"),
                CustomText(text: "Weight: ${widget.user.numKg}"),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Result(year): ",
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.pink,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                      Text(
                          Calculate(widget.user)
                              .calculating()
                              .round()
                              .toString(),
                          style: Calculate(widget.user).calculating().round() >=
                                  70
                              ? Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                  )
                              : Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                  ))
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

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: Theme.of(context).textTheme.headline6?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
    );
  }
}

class Calculate {
  final UserData _userData;
  Calculate(this._userData);

  double calculating() {
    double result;

    result = 73 + _userData.sportCount! - (_userData.cigaraCount! / 2.5);
    if (_userData.numBoy! * 0.45 < _userData.numKg!) {
      double num = _userData.numKg! - _userData.numBoy! * 0.45;
      result = result - (num / 4);
    }
    if (_userData.gender == 'Woman') {
      return result + 3;
    } else {
      return result;
    }
  }
}
