import 'package:Courio/constant/constant.dart';
import 'package:Courio/widget/column_builder.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final recentList = [
    {'title': 'Blue Tokai'},
    {'title': 'Blue Tokai Coffee | Koramangala'},
    {'title': 'Ceekay Supermarket'}
  ];

  final trendingList = [
    {'title': 'Starbucks'},
    {'title': 'Nagarjuna'},
    {'title': 'Natures Basket'},
    {'title': 'Chicken'},
    {'title': 'Cigarettes'},
    {'title': 'Empire'},
    {'title': 'Grocery'},
    {'title': 'Butter Chicken'},
    {'title': 'Chinese Manchuriyan'},
    {'title': 'Hot Dog'}
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Container(
          height: 40.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for stores or restaurants',
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: Colors.grey,
              ),
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: fixPadding,
                    bottom: fixPadding,
                    right: fixPadding * 2.0,
                    left: fixPadding * 2.0),
                color: Colors.grey[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Your recent searches',
                      style: blackSmallBoldTextStyle,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Show more',
                        style: blueSmallTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              ColumnBuilder(
                itemCount: recentList.length,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                itemBuilder: (context, index) {
                  final item = recentList[index];
                  return Container(
                    width: width,
                    color: whiteColor,
                    padding: (index == 0)
                        ? EdgeInsets.all(fixPadding * 2.0)
                        : EdgeInsets.only(
                            right: fixPadding * 2.0,
                            left: fixPadding * 2.0,
                            bottom: fixPadding * 2.0,
                          ),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.history, color: greyColor, size: 22.0),
                          widthSpace,
                          Text(
                            item['title'],
                            style: blackSmallTextStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Container(
                width: width,
                padding: EdgeInsets.only(
                    top: fixPadding,
                    bottom: fixPadding,
                    right: fixPadding * 2.0,
                    left: fixPadding * 2.0),
                color: Colors.grey[100],
                child: Text(
                  'Trending around you',
                  style: blackSmallBoldTextStyle,
                ),
              ),
              ColumnBuilder(
                itemCount: trendingList.length,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                itemBuilder: (context, index) {
                  final item = trendingList[index];
                  return Container(
                    width: width,
                    color: whiteColor,
                    padding: (index == 0)
                        ? EdgeInsets.all(fixPadding * 2.0)
                        : EdgeInsets.only(
                            right: fixPadding * 2.0,
                            left: fixPadding * 2.0,
                            bottom: fixPadding * 2.0,
                          ),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.trending_up,
                              color: Colors.blue, size: 22.0),
                          widthSpace,
                          Text(
                            item['title'],
                            style: blackSmallTextStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
