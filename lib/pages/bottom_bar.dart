import 'dart:io';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:Courio/constant/constant.dart';
import 'package:Courio/pages/home/home.dart';
import 'package:Courio/pages/notifications/notifications.dart';
import 'package:Courio/pages/orders/orders.dart';
import 'package:Courio/pages/search/search.dart';
import 'package:Courio/pages/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex;
  DateTime currentBackPressTime;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        hasNotch: false,
        opacity: 0.2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: primaryColor,
            icon: Icon(
              Icons.home,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.home,
              color: primaryColor,
            ),
            title: Text(
              'Home',
              style: bottomBarItemStyle,
            ),
          ),
          BubbleBottomBarItem(
            backgroundColor: primaryColor,
            icon: Icon(
              Icons.search,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            title: Text(
              'Search',
              style: bottomBarItemStyle,
            ),
          ),
          BubbleBottomBarItem(
            backgroundColor: primaryColor,
            icon: Icon(
              Icons.local_mall,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.local_mall,
              color: primaryColor,
            ),
            title: Text(
              'Orders',
              style: bottomBarItemStyle,
            ),
          ),
          BubbleBottomBarItem(
            backgroundColor: primaryColor,
            icon: Icon(
              Icons.notifications,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.notifications,
              color: primaryColor,
            ),
            title: Text(
              'Notifications',
              style: bottomBarItemStyle,
            ),
          ),
          BubbleBottomBarItem(
            backgroundColor: primaryColor,
            icon: Icon(
              Icons.account_balance_wallet,
              color: greyColor,
            ),
            activeIcon: Icon(
              Icons.account_balance_wallet,
              color: primaryColor,
            ),
            title: Text(
              'Wallet',
              style: bottomBarItemStyle,
            ),
          ),
        ],
      ),
      body: WillPopScope(
        child: (currentIndex == 0)
            ? Home()
            : (currentIndex == 1)
                ? Search()
                : (currentIndex == 2)
                    ? Orders()
                    : (currentIndex == 3)
                        ? Notifications()
                        : Wallet(),
        onWillPop: onWillPop,
      ),
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
