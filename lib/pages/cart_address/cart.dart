import 'package:Courio/constant/constant.dart';
import 'package:Courio/pages/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int number = 1;

  increamentNumber() {
    setState(() {
      number = number + 1;
    });
  }

  decreamentNumber() {
    if (number == 1) {
    } else {
      setState(() {
        number = number - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        titleSpacing: 0.0,
        elevation: 0.5,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Confirm Order',
              style: appBarBlackTextStyle,
            ),
            Text(
              'Bar 61 Restaurant, 76A England',
              style: greySmallTextStyle,
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: blackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 15.0,
        child: Container(
          height: 180.0,
          color: whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 34.0,
                      height: 34.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.0),
                        color: primaryColor,
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: whiteColor,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      width: width - (fixPadding * 4.0 + 10.0 + 34.0 + 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deliver to',
                                style: greySmallBoldTextStyle,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                'Home',
                                style: blackSmallBoldTextStyle,
                              ),
                            ],
                          ),
                          Text(
                              '2nd Floor, Park Plaza, Park Plaza, 215, Indira Nagar',
                              overflow: TextOverflow.ellipsis,
                              style: greySmallTextStyle),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 30.0,
                        child: Icon(
                          Icons.edit,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                height: 1.2,
                color: Colors.grey[200],
              ),
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
                        Text('1 Item', style: blackSmallBoldTextStyle),
                        widthSpace,
                        Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: greyColor,
                          ),
                        ),
                        widthSpace,
                        Text('\$14.7', style: blackSmallBoldTextStyle),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: Payment()));
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            right: fixPadding * 4.0,
                            left: fixPadding * 4.0,
                            top: fixPadding,
                            bottom: fixPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: primaryColor,
                        ),
                        child: Text(
                          'Pay Now',
                          style: whiteBottonTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          // Item List Start
          itemList(),
          // Item List End
          blankSpace(),
          // Invoice Start
          invoice(),
          // Invoice End
        ],
      ),
    );
  }

  itemList() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.store, color: blackColor, size: 18.0),
              SizedBox(width: 5.0),
              Text('Item List', style: blackSmallBoldTextStyle),
            ],
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: (width - (fixPadding * 6.0)) / 2.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 18.0,
                      height: 18.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.green),
                      ),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.green),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      width:
                          ((width - (fixPadding * 6.0)) / 2.0) - (18.0 + 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cold Brew Coffee',
                            style: blackHeadingTextStyle,
                          ),
                          Text(
                            'Bold - Cocoa + Nutty',
                            style: greySmallTextStyle,
                          ),
                          heightSpace,
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                    width: 0.2,
                                    color: greyColor.withOpacity(0.6)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    color: Colors.grey[300],
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Customize',
                                    style: greyNormalTextStyle,
                                  ),
                                  SizedBox(width: 5.0),
                                  Icon(Icons.keyboard_arrow_down,
                                      size: 20.0, color: greyColor),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: (width - (fixPadding * 8.0)) / 2.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(fixPadding),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                            width: 0.2, color: primaryColor.withOpacity(0.6)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              decreamentNumber();
                            },
                            child: Icon(
                              Icons.remove,
                              color: primaryColor,
                              size: 22.0,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '$number',
                            style: primaryColorSmallTextStyle,
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              increamentNumber();
                            },
                            child: Icon(
                              Icons.add,
                              color: primaryColor,
                              size: 22.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$15',
                      style: blackLargeTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  blankSpace() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: fixPadding * 2.0,
      color: Colors.grey[100],
    );
  }

  thinDivider() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width - fixPadding * 4.0,
      height: 1.5,
      color: Colors.grey[100],
    );
  }

  invoice() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invoice',
            style: blackLargeTextStyle,
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Item total',
                style: blackSmallBoldTextStyle,
              ),
              Text(
                '\$15',
                style: blackSmallBoldTextStyle,
              ),
            ],
          ),
          heightSpace,
          thinDivider(),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Partner Delivery Charges',
                style: blackSmallBoldTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$1',
                    style: primaryColorLignThroughSmallBoldTextStyle,
                  ),
                  widthSpace,
                  Text(
                    '\$0.7',
                    style: primaryColorSmallBoldTextStyle,
                  ),
                ],
              ),
            ],
          ),
          heightSpace,
          thinDivider(),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Offer discount',
                style: primaryColorSmallBoldTextStyle,
              ),
              Text(
                '-\$1',
                style: primaryColorSmallBoldTextStyle,
              ),
            ],
          ),
          heightSpace,
          thinDivider(),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Grand total',
                style: blackSmallBoldTextStyle,
              ),
              Text(
                '\$14.7',
                style: blackSmallBoldTextStyle,
              ),
            ],
          ),
          heightSpace,
          thinDivider(),
          heightSpace,
          Container(
            padding: EdgeInsets.all(fixPadding * 0.5),
            width: width - fixPadding * 4.0,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 1.0, color: primaryColor),
            ),
            child: Text(
              'Congratulations! You\'ve saved \$1.3 on this order.',
              style: primaryColorSmallBoldTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
