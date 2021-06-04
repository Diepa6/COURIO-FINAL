import 'package:Courio/constant/constant.dart';
import 'package:Courio/pages/orders/track_order.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 1.0,
        title: Text(
          'Orders',
          style: appBarBlackTextStyle,
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: width,
            padding: EdgeInsets.only(
                top: fixPadding,
                bottom: fixPadding,
                right: fixPadding * 2.0,
                left: fixPadding * 2.0),
            color: Colors.grey[100],
            child: Text(
              'Active orders',
              style: blackSmallBoldTextStyle,
            ),
          ),
          activeOrder(),
          Container(
            width: width,
            padding: EdgeInsets.only(
                top: fixPadding,
                bottom: fixPadding,
                right: fixPadding * 2.0,
                left: fixPadding * 2.0),
            color: Colors.grey[100],
            child: Text(
              'Past orders',
              style: blackSmallBoldTextStyle,
            ),
          ),
          pastOrder(),
        ],
      ),
    );
  }

  activeOrder() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      color: whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/Courio.png',
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.fitHeight,
                  ),
                  widthSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Send packages',
                        style: blackLargeTextStyle,
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Sept 20, 2:40 PM',
                        style: greySmallTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18.0,
                color: greyColor,
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: (width - (fixPadding * 6.0 + 6.0)) / 2.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 30.0,
                      height: 30.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(width: 1.0, color: blackColor),
                      ),
                      child: Icon(
                        Icons.arrow_upward,
                        size: 25.0,
                        color: blackColor,
                      ),
                    ),
                    widthSpace,
                    Container(
                      width: ((width - (fixPadding * 6.0 + 6.0)) / 2.0) -
                          30.0 -
                          10.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Home',
                            style: blackSmallBoldTextStyle,
                          ),
                          Text(
                            '17/2, Combridge row house',
                            style: greySmallTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1.0,
                height: 40.0,
                color: Colors.grey[300],
              ),
              Container(
                width: (width - (fixPadding * 6.0 + 6.0)) / 2.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 30.0,
                      height: 30.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(width: 1.0, color: blackColor),
                      ),
                      child: Icon(
                        Icons.arrow_downward,
                        size: 25.0,
                        color: blackColor,
                      ),
                    ),
                    widthSpace,
                    Container(
                      width: ((width - (fixPadding * 6.0 + 6.0)) / 2.0) -
                          30.0 -
                          10.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Work',
                            style: blackSmallBoldTextStyle,
                          ),
                          Text(
                            '2nd floor, Diamond Nagar',
                            style: greySmallTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          Text(
            'Paid: \$15',
            style: primaryColorSmallTextStyle,
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 30.0,
                    height: 30.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: primaryColor.withOpacity(0.3),
                    ),
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: primaryColor,
                      ),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                  widthSpace,
                  Text(
                    'Order in progress',
                    style: blackSmallBoldTextStyle,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: TrackOrder()));
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: fixPadding * 0.7,
                    bottom: fixPadding * 0.7,
                    right: fixPadding * 3.0,
                    left: fixPadding * 3.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: primaryColor,
                  ),
                  child: Text(
                    'Track order',
                    style: whiteBottonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  pastOrder() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      color: whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/grocery.png',
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.fitHeight,
                  ),
                  widthSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Grocery',
                        style: blackLargeTextStyle,
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Sept 05, 3:47 PM',
                        style: greySmallTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18.0,
                color: greyColor,
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: (width - (fixPadding * 6.0 + 6.0)) / 2.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 30.0,
                      height: 30.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(width: 1.0, color: blackColor),
                      ),
                      child: Icon(
                        Icons.arrow_upward,
                        size: 25.0,
                        color: blackColor,
                      ),
                    ),
                    widthSpace,
                    Container(
                      width: ((width - (fixPadding * 6.0 + 6.0)) / 2.0) -
                          30.0 -
                          10.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Home',
                            style: blackSmallBoldTextStyle,
                          ),
                          Text(
                            '17/2, Combridge row house',
                            style: greySmallTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1.0,
                height: 40.0,
                color: Colors.grey[300],
              ),
              Container(
                width: (width - (fixPadding * 6.0 + 6.0)) / 2.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 30.0,
                      height: 30.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(width: 1.0, color: blackColor),
                      ),
                      child: Icon(
                        Icons.arrow_downward,
                        size: 25.0,
                        color: blackColor,
                      ),
                    ),
                    widthSpace,
                    Container(
                      width: ((width - (fixPadding * 6.0 + 6.0)) / 2.0) -
                          30.0 -
                          10.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Work',
                            style: blackSmallBoldTextStyle,
                          ),
                          Text(
                            '2nd floor, Diamond Nagar',
                            style: greySmallTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          Text(
            'Paid: \$35',
            style: primaryColorSmallTextStyle,
          ),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 22.0,
                    height: 22.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.0),
                      color: primaryColor,
                    ),
                    child: Icon(
                      Icons.check,
                      color: whiteColor,
                      size: 14.0,
                    ),
                  ),
                  widthSpace,
                  Text(
                    'Completed',
                    style: blackSmallBoldTextStyle,
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(
                    top: fixPadding * 0.7,
                    bottom: fixPadding * 0.7,
                    right: fixPadding * 3.0,
                    left: fixPadding * 3.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: primaryColor,
                  ),
                  child: Text(
                    'Reorder',
                    style: whiteBottonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
