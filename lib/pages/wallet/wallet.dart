import 'package:Courio/constant/constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Wallet extends StatelessWidget {
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
          'CourioPro Cash',
          style: appBarBlackTextStyle,
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: width,
            height: 150.0,
            color: Colors.deepPurple[300],
            child: Stack(
              children: [
                Positioned(
                  top: fixPadding * 2.0,
                  left: fixPadding * 2.0,
                  child: Text(
                    '\$15',
                    style: yellowExtraLargeTextStyle,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Image.asset(
                    'assets/coin.png',
                    height: 125.0,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Share code & save at least 25%',
                  style: blackLargeTextStyle,
                ),
                SizedBox(height: 5.0),
                Text(
                  'Your friend gets \$5 Courio Pro cash on sign up. You get \$5 when they complete an order of \$2 or more within 21 days. You can earn upto \$20 Courio Pro Cash.',
                  style: greySmallTextStyle,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Your Referral Code',
                  style: blackSmallTextStyle,
                ),
                SizedBox(height: 5.0),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  strokeWidth: 1.2,
                  color: greyColor.withOpacity(0.6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: 200.0,
                      padding: EdgeInsets.all(fixPadding),
                      decoration: BoxDecoration(color: whiteColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'SLP809',
                            style: primaryColorHeadingTextStyle,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.content_copy,
                              color: primaryColor,
                              size: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: (width - (fixPadding * 6.0)) / 2.0,
                      padding: EdgeInsets.all(fixPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.green.withOpacity(0.6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Whatsapp',
                            style: whiteBottonTextStyle,
                          ),
                          Icon(FontAwesomeIcons.whatsapp,
                              color: whiteColor, size: 25.0),
                        ],
                      ),
                    ),
                    Container(
                      width: (width - (fixPadding * 6.0)) / 2.0,
                      padding: EdgeInsets.all(fixPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(width: 0.3, color: greyColor),
                        color: whiteColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'More Options',
                            style: blackBottonTextStyle,
                          ),
                          Icon(Icons.share, color: blackColor, size: 22.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
