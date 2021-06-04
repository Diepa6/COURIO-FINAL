import 'package:Courio/constant/constant.dart';
import 'package:Courio/pages/cart_address/cart.dart';
import 'package:flutter/material.dart';

class GetGroceryDeliver extends StatefulWidget {
  @override
  _GetGroceryDeliverState createState() => _GetGroceryDeliverState();
}

class _GetGroceryDeliverState extends State<GetGroceryDeliver> {
  bool vegOnly = false;

  bool option1 = false;
  bool option2 = false;

  final itemListData = [
    {
      'name': 'Amul Taaza pastourized toned milk',
      'image': 'assets/grocery/grocery_1.png',
      'desc': 'Amul taaza fresh toned milk.',
      'price': '1'
    },
    {
      'name': 'Best Plus Egg',
      'image': 'assets/grocery/grocery_2.png',
      'desc': '10 Pcs.',
      'price': '1.2'
    },
    {
      'name': 'Fresho Onion - Organically Grown',
      'image': 'assets/grocery/grocery_3.png',
      'desc': 'It is organically grown and handpicked from farm.',
      'price': '0.8'
    },
    {
      'name': 'Epigamia Greek Yogurt',
      'image': 'assets/grocery/grocery_4.png',
      'desc': 'Honey and banana',
      'price': '0.5'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
            preferredSize: Size.fromHeight(160.0),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Grocery',
                                style: blackLargeTextStyle,
                              ),
                              Text(
                                'Spar Hypermarket, MG Road',
                                style: greySmallTextStyle,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(fixPadding * 0.7),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10.0),
                                border:
                                    Border.all(width: 0.2, color: greyColor),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    color: Colors.grey[300],
                                  ),
                                ],
                              ),
                              child: Text(
                                'Change Store'.toUpperCase(),
                                style: primaryColorSmallTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      heightSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.timer, color: greyColor, size: 18.0),
                          SizedBox(width: 3.0),
                          Text(
                            '15 mins, Free delivery',
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
                    ],
                  ),
                ),
                Container(
                  child: TabBar(
                    indicatorColor: primaryColor,
                    indicatorPadding: EdgeInsets.only(right: 15.0, left: 15.0),
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'Bestseller'.toUpperCase()),
                      Tab(text: 'Dairy'.toUpperCase()),
                      Tab(text: 'Fruits'.toUpperCase()),
                      Tab(text: 'Bevarages'.toUpperCase()),
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
              Image.asset(
                item['image'],
                width: 75.0,
                height: 75.0,
                fit: BoxFit.fitHeight,
              ),
              widthSpace,
              Container(
                width: width - (fixPadding * 4.0 + 75.0 + 10.0 + 100.0),
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
                              'Best Plus Egg',
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
                        Text('Choice of quantity',
                            style: blackHeadingTextStyle),
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
                              Text('10 Pieces', style: inputTextStyle),
                              widthSpace,
                              Text(
                                '\$5',
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
                              Text('20 Pieces', style: inputTextStyle),
                              widthSpace,
                              Text(
                                '\$8',
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
                                'Best Plus Egg',
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
