import 'dart:async';

import 'package:Courio/constant/constant.dart';
import 'package:Courio/pages/login_signup/walkthrough.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WalkThrough()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueColor,
      body: Padding(
        padding: EdgeInsets.all(fixPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'CourioPro',
                style: splashBigTextStyle,
              ),
              heightSpace,
              Text(
                'on-demand delivery available 24x7',
                style: whiteNormalTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
