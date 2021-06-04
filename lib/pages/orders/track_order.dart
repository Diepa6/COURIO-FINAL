import 'package:Courio/constant/constant.dart';
import 'package:Courio/pages/Courio/route_map.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Track order',
              style: appBarBlackTextStyle,
            ),
            SizedBox(height: 5.0),
            Text(
              'Package Send',
              style: greySmallTextStyle,
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: blackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomSheet: Wrap(
        children: [
          Material(
            elevation: 7.0,
            color: whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.access_time, color: greyColor, size: 25.0),
                      widthSpace,
                      Text(
                        'Delivery by',
                        style: greyNormalTextStyle,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '4:10 PM',
                        style: blackLargeTextStyle,
                      ),
                    ],
                  ),
                ),
                getDevider(),
                Container(
                  padding: EdgeInsets.only(
                      left: fixPadding * 2.0, right: fixPadding * 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 2.0,
                                height: 30.0,
                                color: primaryColor,
                              ),
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
                              DottedLine(
                                direction: Axis.vertical,
                                lineLength: 50.0,
                                lineThickness: 2.0,
                                dashLength: 4.0,
                                dashColor: primaryColor,
                                dashRadius: 0.0,
                                dashGapLength: 4.0,
                                dashGapColor: Colors.transparent,
                                dashGapRadius: 0.0,
                              ),
                            ],
                          ),
                          widthSpace,
                          Container(
                            width:
                                width - (fixPadding * 4.0 + 10.0 + 30.0 + 50.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Items have been picked up',
                                  style: blackHeadingTextStyle,
                                ),
                                Text(
                                  'Partner have been picked up your items and is on his way to the delivery location',
                                  style: greySmallTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_down,
                          color: greyColor, size: 24.0),
                    ],
                  ),
                ),
                getDevider(),
                Container(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/delivery_boy.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          widthSpace,
                          Text(
                            'Peter Jones',
                            style: blackLargeTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.chat_bubble_outline,
                                color: greyColor, size: 28.0),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon:
                                Icon(Icons.call, color: greyColor, size: 28.0),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                getDevider(),
                Container(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '4 items - \$20',
                            style: blackHeadingTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Order Details',
                                style: blueSmallTextStyle,
                              ),
                              SizedBox(width: 3.0),
                              Icon(Icons.arrow_forward_ios,
                                  size: 10.0, color: greyColor),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Paid successfully',
                            style: greySmallTextStyle,
                          ),
                          SizedBox(width: 5.0),
                          Container(
                            width: 30.0,
                            height: 30.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.deepPurple.withOpacity(0.16),
                            ),
                            child: Icon(Icons.check,
                                color: Colors.deepPurple, size: 18.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: RouteMap(
          sourceLat: 51.5075132,
          sourceLang: -0.1279052,
          destinationLat: 51.5192763,
          destinationLang: -0.1237237),
    );
  }

  getDevider() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 1.0,
      color: Colors.grey[200],
    );
  }
}
