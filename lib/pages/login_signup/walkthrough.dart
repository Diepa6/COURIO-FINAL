import 'dart:io';

import 'package:Courio/constant/constant.dart';
import 'package:Courio/pages/login_signup/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class WalkThrough extends StatefulWidget {
  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: WillPopScope(
        child: Container(
          width: width,
          height: height,
          color: darkBlueColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
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
              Container(
                width: width - fixPadding * 4.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getItems('assets/icons/Courio.png', 'Send packages',
                        'Pick and drop items like keys, chargers and documents in the city'),
                    heightSpace,
                    heightSpace,
                    getItems('assets/icons/food.png', 'Order food',
                        'Order food from your favourite restaurant and we will deliver it'),
                    heightSpace,
                    heightSpace,
                    getItems('assets/icons/grocery.png', 'Order grocery',
                        'Order grocery from supermarket or grocery shop and we will deliver it'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(fixPadding * 2.0),
                color: whiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get started with CourioPro',
                      style: blackLargeTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: Login()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '+1',
                            style: blackSmallTextStyle,
                          ),
                          widthSpace,
                          widthSpace,
                          Text(
                            'Enter your mobile number',
                            style: greySmallTextStyle,
                          ),
                        ],
                      ),
                    ),
                    heightSpace,
                    Container(
                      width: width - fixPadding * 4.0,
                      height: 1.3,
                      color: greyColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onWillPop: onWillPop,
      ),
    );
  }

  getItems(String image, String title, String desc) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(35.0),
          ),
          child: Image.asset(
            image,
            width: 40.0,
            height: 40.0,
            fit: BoxFit.scaleDown,
          ),
        ),
        widthSpace,
        widthSpace,
        widthSpace,
        Container(
          width: width - (fixPadding * 4.0 + 70.0 + 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: whiteLargeTextStyle,
              ),
              heightSpace,
              Text(
                desc,
                style: whiteSmallTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return Future.value(false);
    }
    exit(0);
  }
}
