import 'package:Courio/constant/constant.dart';
import 'package:Courio/pages/cart_address/cart.dart';
import 'package:flutter/material.dart';

class RestaurantItems extends StatefulWidget {
  @override
  _RestaurantItemsState createState() => _RestaurantItemsState();
}

class _RestaurantItemsState extends State<RestaurantItems> {
  bool vegOnly = false;

  bool option1 = false;
  bool option2 = false;

  final itemListData = [
    {
      'name': 'Homemade Special Granola Bowl',
      'desc': 'Served with greek yogurt, mixed nuts and seeds',
      'type': 'veg',
      'price': '4'
    },
    {
      'name': 'Green Smoothie Bowl',
      'desc': 'Topped with banana, nuts and pomegranate seeds.',
      'type': 'veg',
      'price': '3.5'
    },
    {
      'name': 'Green Smoothie Bowl Made With Almond Milk',
      'desc': 'Topped with banana, nuts and pomegranate seeds, vegan',
      'type': 'nonveg',
      'price': '5'
    },
    {
      'name': 'Banana, Cacao And Espresso Smoothie Bowl',
      'desc': 'Topped with homemade spiced granola and seasonal fruit',
      'type': 'veg',
      'price': '3'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: blackColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(220.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: fixPadding * 2.0,
                    left: fixPadding * 2.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bar 61 Restaurant',
                        style: blackLargeTextStyle,
                      ),
                      Text(
                        '76A England',
                        style: greySmallTextStyle,
                      ),
                      heightSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.timer, color: greyColor, size: 18.0),
                          SizedBox(width: 3.0),
                          Text(
                            '42 mins delivery',
                            style: inputTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.local_offer,
                              color: Colors.deepPurple, size: 18.0),
                          SizedBox(width: 3.0),
                          Text(
                            '50% off upto \$5, Min order \$10',
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'VEG ONLY',
                            style: greyNormalTextStyle,
                          ),
                          SizedBox(width: 3.0),
                          Switch(
                            value: vegOnly,
                            onChanged: (value) {
                              setState(() {
                                vegOnly = value;
                              });
                            },
                            activeTrackColor: primaryColor.withOpacity(0.4),
                            activeColor: primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: TabBar(
                    indicatorColor: primaryColor,
                    indicatorPadding: EdgeInsets.only(right: 15.0, left: 15.0),
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'Chinese'.toUpperCase()),
                      Tab(text: 'Salads'.toUpperCase()),
                      Tab(text: 'Dessert'.toUpperCase()),
                      Tab(text: 'Brews'.toUpperCase()),
                      Tab(text: 'Continental'.toUpperCase()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            itemList(),
            itemList(),
            itemList(),
            itemList(),
            itemList(),
          ],
        ),
      ),
    );
  }

  itemList() {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: itemListData.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final item = itemListData[index];
        return Container(
          width: width,
          margin: (index == 0)
              ? EdgeInsets.all(fixPadding * 2.0)
              : EdgeInsets.only(
                  right: fixPadding * 2.0,
                  left: fixPadding * 2.0,
                  bottom: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 26.0,
                height: 26.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0,
                      color:
                          (item['type'] == 'veg') ? Colors.green : Colors.red),
                ),
                child: Container(
                  width: 16.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color:
                          (item['type'] == 'veg') ? Colors.green : Colors.red),
                ),
              ),
              widthSpace,
              Container(
                width: width - (fixPadding * 4.0 + 26.0 + 10.0 + 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
                      style: blackLargeTextStyle,
                    ),
                    Text(
                      item['desc'],
                      style: greySmallTextStyle,
                    ),
                    Text(
                      '\$${item['price']}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                width: 100.0,
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => _addToCartBottomSheet(context),
                  child: Container(
                    width: 80.0,
                    padding: EdgeInsets.all(fixPadding * 0.8),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(width: 0.5, color: Colors.grey[200]),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                          color: Colors.grey[300],
                        )
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text('+ ADD', style: primaryColorHeadingTextStyle),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Bottom Sheet for Add Item to Cart Starts Here
  void _addToCartBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: whiteColor,
        builder: (BuildContext bc) {
          double width = MediaQuery.of(context).size.width;
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(fixPadding * 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/customize.png',
                          width: 70.0,
                          height: 70.0,
                          fit: BoxFit.fitWidth,
                        ),
                        IconButton(
                          icon:
                              Icon(Icons.close, color: blackColor, size: 22.0),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: fixPadding * 2.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customize',
                          style: blackExtraLargeTextStyle,
                        ),
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 18.0,
                              height: 18.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.0, color: Colors.green),
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
                            Text(
                              'Cold Brew Coffee',
                              style: greySmallTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: fixPadding * 3.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: fixPadding * 2.0, right: fixPadding * 2.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Choice of Coffee', style: blackHeadingTextStyle),
                        heightSpace,
                        InkWell(
                          onTap: () {
                            setState(() {
                              option1 = true;
                              option2 = false;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 18.0,
                                height: 18.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.green),
                                ),
                                child: Container(
                                  width: 12.0,
                                  height: 12.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.green),
                                ),
                              ),
                              widthSpace,
                              Container(
                                width: 18.0,
                                height: 18.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9.0),
                                  border: Border.all(
                                      width: 1.0,
                                      color: (option1)
                                          ? primaryColor
                                          : Colors.grey[500]),
                                ),
                                child: Container(
                                  width: 12.0,
                                  height: 12.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: (option1)
                                        ? primaryColor
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                              widthSpace,
                              Text('Light - Fruity + Milk Chocolate',
                                  style: inputTextStyle),
                              widthSpace,
                              Text(
                                '\$0',
                                style: greySmallTextStyle,
                              ),
                            ],
                          ),
                        ),
                        heightSpace,
                        InkWell(
                          onTap: () {
                            setState(() {
                              option2 = true;
                              option1 = false;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 18.0,
                                height: 18.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.green),
                                ),
                                child: Container(
                                  width: 12.0,
                                  height: 12.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.green),
                                ),
                              ),
                              widthSpace,
                              Container(
                                width: 18.0,
                                height: 18.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9.0),
                                  border: Border.all(
                                      width: 1.0,
                                      color: (option2)
                                          ? primaryColor
                                          : Colors.grey[500]),
                                ),
                                child: Container(
                                  width: 12.0,
                                  height: 12.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: (option2)
                                        ? primaryColor
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                              widthSpace,
                              Text('Bold - Cocoa + Nutty',
                                  style: inputTextStyle),
                              widthSpace,
                              Text(
                                '\$0',
                                style: greySmallTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: fixPadding * 1.0,
                  ),
                  Material(
                    elevation: 7.0,
                    color: whiteColor,
                    child: Container(
                      width: width,
                      padding: EdgeInsets.all(fixPadding * 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Bold - Cocoa',
                                style: greySmallTextStyle,
                              ),
                              Text(
                                '+1 more',
                                style: greySmallTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Item Total',
                                    style: blackHeadingTextStyle,
                                  ),
                                  SizedBox(width: 5.0),
                                  Container(
                                    width: 10.0,
                                    height: 10.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    '\$5',
                                    style: priceTextStyle,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Cart()));
                                },
                                child: Container(
                                  width: 120.0,
                                  padding: EdgeInsets.all(fixPadding * 0.6),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: primaryColor,
                                  ),
                                  child: Text(
                                    'Add Item',
                                    style: whiteBottonTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
  // Bottom Sheet for Add Item to Cart End Here
}
