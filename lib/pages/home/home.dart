import 'package:Courio/constant/constant.dart';
import 'package:Courio/pages/Courio/get_grocery_deliver.dart';
import 'package:Courio/pages/Courio/send_packages.dart';
import 'package:Courio/pages/invite_friend/invite_friend.dart';
import 'package:Courio/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 1.0,
        title: Text('Welcome to Courio Pro', style: appBarTextStyle),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: primaryColor),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: Profile()));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(fixPadding),
            width: width - (fixPadding * 2.0),
            height: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/banner.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          heightSpace,
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.scale,
                      alignment: Alignment.bottomCenter,
                      child: InviteFriend()));
            },
            child: Container(
              padding: EdgeInsets.all(fixPadding * 2.0),
              color: lightPrimaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/wallet.png',
                        width: 35.0,
                        height: 35.0,
                        fit: BoxFit.fitHeight,
                      ),
                      widthSpace,
                      Container(
                        width: width - (fixPadding * 4.0 + 35.0 + 30.0 + 10.0),
                        child: Text(
                            'Invite friends to Courio Pro to earn upto \$20 Courio Pro Cash',
                            style: blackSmallTextStyle),
                      ),
                    ],
                  ),
                  Container(
                    width: 30.0,
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_forward_ios,
                        color: greyColor, size: 18.0),
                  ),
                ],
              ),
            ),
          ),

          // Courio Type Start

          // Send Packages Start
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SendPackages()));
            },
            child: Hero(
              tag: 'Send Packages',
              child: Container(
                margin: EdgeInsets.only(
                    top: fixPadding * 2.0,
                    right: fixPadding * 2.0,
                    left: fixPadding * 2.0),
                padding: EdgeInsets.all(fixPadding * 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  border: Border.all(width: 0.2, color: primaryColor),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1.5,
                      color: primaryColor.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: primaryColor.withOpacity(0.2),
                      ),
                      child: Image.asset(
                        'assets/icons/Courio.png',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    widthSpace,
                    Container(
                      width: width - (fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Send Packages',
                              style: primaryColorHeadingTextStyle),
                          Text('Send packages to anywhere and anytime.',
                              style: greySmallTextStyle)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Send Packages Start

          // Grocery Deliver Start
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetGroceryDeliver()));
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: fixPadding * 2.0,
                  right: fixPadding * 2.0,
                  left: fixPadding * 2.0),
              padding: EdgeInsets.all(fixPadding * 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: whiteColor,
                border: Border.all(width: 0.2, color: primaryColor),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 1.5,
                    spreadRadius: 1.5,
                    color: primaryColor.withOpacity(0.2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: primaryColor.withOpacity(0.2),
                    ),
                    child: Image.asset(
                      'assets/icons/grocery.png',
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  widthSpace,
                  Container(
                    width: width - (fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Get Grocery Deliver',
                            style: primaryColorHeadingTextStyle),
                        Text(
                            'Order grocery at your favourite store and we will deliver it.',
                            style: greySmallTextStyle)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // Grocery Deliver Start
          // Courio Type End
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }
}
