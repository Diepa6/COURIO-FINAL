import 'package:Courio/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final notificationList = [
    {
      'type': 'order',
      'title': 'Order Placed',
      'desc': 'Your order placed successfully. OrderId: OID1256789.'
    },
    {
      'type': 'offer',
      'title': '25% Off use code CourioPro25',
      'desc':
          'Use code CourioPro25 for your order between 20th sept to 25th sept and get 25% off.'
    },
    {
      'type': 'offer',
      'title': 'Flat \$10 Off',
      'desc': 'Use code CPro10 and get \$10 off on your order.'
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        automaticallyImplyLeading: false,
        title: Text(
          'Notifications',
          style: appBarBlackTextStyle,
        ),
      ),
      body: (notificationList.length == 0)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.bellSlash,
                    color: Colors.grey,
                    size: 60.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'No Notifications',
                    style: greyNormalTextStyle,
                  )
                ],
              ),
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: notificationList.length,
              itemBuilder: (context, index) {
                final item = notificationList[index];
                return Dismissible(
                  key: Key('$item'),
                  onDismissed: (direction) {
                    setState(() {
                      notificationList.removeAt(index);
                    });

                    // Then show a snackbar.
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("${item['title']} dismissed")));
                  },
                  // Show a red background as the item is swiped away.
                  background: Container(color: Colors.red),
                  child: Center(
                    child: Container(
                      width: width - 20.0,
                      margin: EdgeInsets.only(top: 3.0, bottom: 3.0),
                      child: Card(
                        elevation: 2.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                child: Icon(
                                  (item['type'] == 'order')
                                      ? Icons.local_shipping
                                      : Icons.local_offer,
                                  size: 30.0,
                                ),
                                radius: 40.0,
                              ),
                            ),
                            Container(
                              width: width - 130.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.0, right: 8.0, left: 8.0),
                                    child: Text(
                                      '${item['title']}',
                                      style: blackHeadingTextStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '${item['desc']}',
                                      style: greySmallTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
