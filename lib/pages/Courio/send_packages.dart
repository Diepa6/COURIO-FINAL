import 'package:Courio/constant/constant.dart';
import 'package:Courio/constant/key.dart';
import 'package:Courio/pages/Courio/route_map.dart';
import 'package:Courio/pages/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show cos, sqrt, asin;

import 'package:page_transition/page_transition.dart';

class SendPackages extends StatefulWidget {
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);
  @override
  _SendPackagesState createState() => _SendPackagesState();
}

class _SendPackagesState extends State<SendPackages> {
  // For Screens
  bool packageTypeScreen = true;
  bool packageSizeWeightScreen = false;
  bool selectPickUpAddressScreen = false;
  bool selectDeliveryAddressScreen = false;
  bool confirmScreen = false;

  // For Package Type
  bool documents = false, parcel = false;

  // For Package Size and Weight Screen
  bool height = false, widthInput = false, depth = false, weight = false;
  final heightController = TextEditingController();
  final widthController = TextEditingController();
  final depthController = TextEditingController();
  final weightController = TextEditingController();

  // For Pickup Address Screen
  PickResult selectedPickupPlace;
  final pickupAddressController = TextEditingController();
  bool pickupAddress = false;

  // For Delivery Address Screen
  PickResult selectedDeliveryPlace;
  final deliveryAddressController = TextEditingController();
  bool deliveryAddress = false;

  // Calculate Distance Between two Locations
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return (12742 * asin(sqrt(a)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Hero(
      tag: 'Send Packages',
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0.0,
          titleSpacing: 0.0,
          title: Text(
              (packageTypeScreen)
                  ? 'Select Package Type'
                  : (packageSizeWeightScreen)
                      ? 'Enter Package Size and Weight'
                      : (selectPickUpAddressScreen)
                          ? 'Select Pickup Address'
                          : (selectDeliveryAddressScreen)
                              ? 'Select Delivery Address'
                              : (confirmScreen)
                                  ? 'Confirm Details'
                                  : '',
              style: appBarBlackTextStyle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: blackColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: (packageTypeScreen)
                  ? selectPackageTypeScreen()
                  : (packageSizeWeightScreen)
                      ? enterPackageSizeWeightScreen()
                      : (selectPickUpAddressScreen)
                          ? selectPickupAddressScreenCode()
                          : (selectDeliveryAddressScreen)
                              ? selectDeliveryAddressScreenCode()
                              : (confirmScreen)
                                  ? confirmScreenCode()
                                  : Container(),
            ),
            Container(
              width: width,
              height: 85.0,
              color: whiteColor,
              alignment: Alignment.center,
              padding: EdgeInsets.all(fixPadding * 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (packageTypeScreen) ? Container() : backButton(),
                  continueButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectPackageTypeScreen() {
    double width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // For Document Start
              InkWell(
                onTap: () {
                  setState(() {
                    documents = true;
                    parcel = false;
                  });
                },
                child: Container(
                  width: (width - (fixPadding * 6.0)) / 2.0,
                  child: Column(
                    children: [
                      Container(
                        width: (width - (fixPadding * 6.0)) / 2.0,
                        padding: EdgeInsets.only(
                            top: fixPadding * 2.0, bottom: fixPadding * 2.0),
                        decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                              width: 0.8,
                              color: (documents)
                                  ? primaryColor
                                  : greyColor.withOpacity(0.2)),
                        ),
                        child: Container(
                          width: (width - (fixPadding * 6.0)) / 2.0,
                          padding: EdgeInsets.only(right: fixPadding * 2.0),
                          height: 170.0,
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/icons/document_type.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          child: Container(
                            width: 26.0,
                            height: 26.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: (documents) ? primaryColor : greyColor,
                              borderRadius: BorderRadius.circular(13.0),
                              border: Border.all(
                                  width: 1.0,
                                  color:
                                      (documents) ? primaryColor : greyColor),
                            ),
                            child: Icon(Icons.check,
                                color: (documents) ? whiteColor : greyColor,
                                size: 18.0),
                          ),
                        ),
                      ),
                      heightSpace,
                      Text(
                        'Documents',
                        style: blackLargeTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              // For Document End

              // For Parcel Start
              InkWell(
                onTap: () {
                  setState(() {
                    documents = false;
                    parcel = true;
                  });
                },
                child: Container(
                  width: (width - (fixPadding * 6.0)) / 2.0,
                  child: Column(
                    children: [
                      Container(
                        width: (width - (fixPadding * 6.0)) / 2.0,
                        padding: EdgeInsets.only(
                            top: fixPadding * 2.0, bottom: fixPadding * 2.0),
                        decoration: BoxDecoration(
                          color: greyColor.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                              width: 0.8,
                              color: (parcel)
                                  ? primaryColor
                                  : greyColor.withOpacity(0.2)),
                        ),
                        child: Container(
                          width: (width - (fixPadding * 6.0)) / 2.0,
                          padding: EdgeInsets.only(right: fixPadding * 2.0),
                          height: 170.0,
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icons/parcel_type.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          child: Container(
                            width: 26.0,
                            height: 26.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: (parcel) ? primaryColor : greyColor,
                              borderRadius: BorderRadius.circular(13.0),
                              border: Border.all(
                                  width: 1.0,
                                  color: (parcel) ? primaryColor : greyColor),
                            ),
                            child: Icon(Icons.check,
                                color: (parcel) ? whiteColor : greyColor,
                                size: 18.0),
                          ),
                        ),
                      ),
                      heightSpace,
                      Text(
                        'Parcel',
                        style: blackLargeTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              // For Parcel End
            ],
          ),
        ),
      ],
    );
  }

  enterPackageSizeWeightScreen() {
    double width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(fixPadding * 2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Height Start
              Text('Height', style: primaryColorHeadingTextStyle),
              heightSpace,
              Container(
                width: width - (fixPadding * 4.0),
                height: 50.0,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border:
                      Border.all(width: 0.8, color: greyColor.withOpacity(0.6)),
                ),
                child: TextField(
                  style: inputTextStyle,
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  decoration: InputDecoration(
                    hintText: 'Please Enter Package Height in cm',
                    hintStyle: inputTextStyle,
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (v) {
                    if (heightController.text != '') {
                      setState(() {
                        height = true;
                      });
                    } else {
                      setState(() {
                        height = false;
                      });
                    }
                  },
                ),
              ),
              heightSpace,
              Text('Enter height in cm', style: infoTextStyle),
              // Height End
              heightSpace,
              heightSpace,
              // Width Start
              Text('Width', style: primaryColorHeadingTextStyle),
              heightSpace,
              Container(
                width: width - (fixPadding * 4.0),
                height: 50.0,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border:
                      Border.all(width: 0.8, color: greyColor.withOpacity(0.6)),
                ),
                child: TextField(
                  style: inputTextStyle,
                  keyboardType: TextInputType.number,
                  controller: widthController,
                  decoration: InputDecoration(
                    hintText: 'Please Enter Package Width in cm',
                    hintStyle: inputTextStyle,
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (v) {
                    if (widthController.text != '') {
                      setState(() {
                        widthInput = true;
                      });
                    } else {
                      setState(() {
                        widthInput = false;
                      });
                    }
                  },
                ),
              ),
              heightSpace,
              Text('Enter width in cm', style: infoTextStyle),
              // Width End
              heightSpace,
              heightSpace,
              // Depth Start
              Text('Depth', style: primaryColorHeadingTextStyle),
              heightSpace,
              Container(
                width: width - (fixPadding * 4.0),
                height: 50.0,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border:
                      Border.all(width: 0.8, color: greyColor.withOpacity(0.6)),
                ),
                child: TextField(
                  style: inputTextStyle,
                  keyboardType: TextInputType.number,
                  controller: depthController,
                  decoration: InputDecoration(
                    hintText: 'Please Enter Package Depth in cm',
                    hintStyle: inputTextStyle,
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (v) {
                    if (depthController.text != '') {
                      setState(() {
                        depth = true;
                      });
                    } else {
                      setState(() {
                        depth = false;
                      });
                    }
                  },
                ),
              ),
              heightSpace,
              Text('Enter depth in cm', style: infoTextStyle),
              // Depth End
              heightSpace,
              heightSpace,
              // Weight Start
              Text('Weight', style: primaryColorHeadingTextStyle),
              heightSpace,
              Container(
                width: width - (fixPadding * 4.0),
                height: 50.0,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border:
                      Border.all(width: 0.8, color: greyColor.withOpacity(0.6)),
                ),
                child: TextField(
                  style: inputTextStyle,
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  decoration: InputDecoration(
                    hintText: 'Please Enter Package Weight in kg',
                    hintStyle: inputTextStyle,
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                  ),
                  onChanged: (v) {
                    if (weightController.text != '') {
                      setState(() {
                        weight = true;
                      });
                    } else {
                      setState(() {
                        weight = false;
                      });
                    }
                  },
                ),
              ),
              heightSpace,
              Text('Enter weight in kg', style: infoTextStyle),
              // Weight End
            ],
          ),
        ),
      ],
    );
  }

  // Pickup Address Screen Start
  selectPickupAddressScreenCode() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Container(
          width: width,
          height: height - 85.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Load Google Map"),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PlacePicker(
                            apiKey: googleMapKey,
                            initialPosition: SendPackages.kInitialPosition,
                            useCurrentLocation: true,
                            selectInitialPosition: true,

                            //usePlaceDetailSearch: true,
                            onPlacePicked: (result) {
                              selectedPickupPlace = result;
                              Navigator.of(context).pop();
                              setState(() {});
                            },
                            selectedPlaceWidgetBuilder:
                                (_, selectedPlace, state, isSearchBarFocused) {
                              return isSearchBarFocused
                                  ? Container()
                                  : FloatingCard(
                                      bottomPosition: 0.0,
                                      leftPosition: 0.0,
                                      rightPosition: 0.0,
                                      width: 500,
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: state == SearchingState.Searching
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : RaisedButton(
                                              child: Text("Pick This Place"),
                                              onPressed: () {
                                                print(selectedPlace
                                                    .geometry.location);
                                                Navigator.pop(
                                                    context, selectedPlace);
                                                setState(() {});
                                              },
                                            ),
                                    );
                            },
                          );
                        },
                      ),
                    );

                    setState(() {
                      selectedPickupPlace = result;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Place marker on google map at pickup location',
                          style: greySmallTextStyle),
                      heightSpace,
                      (selectedPickupPlace == null)
                          ? Container()
                          : Text(
                              selectedPickupPlace.formattedAddress ?? "",
                              textAlign: TextAlign.center,
                              style: inputTextStyle,
                            ),
                      (selectedPickupPlace == null) ? Container() : heightSpace,
                      Text('Pickup Address',
                          style: primaryColorHeadingTextStyle),
                      heightSpace,
                      Container(
                        width: width - (fixPadding * 4.0),
                        height: 120.0,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              width: 0.8, color: greyColor.withOpacity(0.6)),
                        ),
                        child: TextField(
                          style: inputTextStyle,
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          controller: pickupAddressController,
                          decoration: InputDecoration(
                            hintText: 'Please enter exact pickup address',
                            hintStyle: inputTextStyle,
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none,
                          ),
                          onChanged: (v) {
                            if (pickupAddressController.text != '') {
                              setState(() {
                                pickupAddress = true;
                              });
                            } else {
                              setState(() {
                                pickupAddress = false;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  // Pickup Address Screen End

  // Delivery Address Screen Start
  selectDeliveryAddressScreenCode() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Container(
          width: width,
          height: height - 85.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Load Google Map"),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PlacePicker(
                            apiKey: googleMapKey,
                            initialPosition: SendPackages.kInitialPosition,
                            useCurrentLocation: true,
                            selectInitialPosition: true,

                            //usePlaceDetailSearch: true,
                            onPlacePicked: (result) {
                              selectedDeliveryPlace = result;
                              Navigator.of(context).pop();
                              setState(() {});
                            },
                            selectedPlaceWidgetBuilder:
                                (_, selectedPlace, state, isSearchBarFocused) {
                              return isSearchBarFocused
                                  ? Container()
                                  : FloatingCard(
                                      bottomPosition: 0.0,
                                      leftPosition: 0.0,
                                      rightPosition: 0.0,
                                      width: 500,
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: state == SearchingState.Searching
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : RaisedButton(
                                              child: Text("Pick This Place"),
                                              onPressed: () {
                                                Navigator.pop(
                                                    context, selectedPlace);
                                                setState(() {});
                                              },
                                            ),
                                    );
                            },
                          );
                        },
                      ),
                    );

                    setState(() {
                      selectedDeliveryPlace = result;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Place marker on google map at delivery location',
                          style: greySmallTextStyle),
                      heightSpace,
                      (selectedDeliveryPlace == null)
                          ? Container()
                          : Text(
                              selectedDeliveryPlace.formattedAddress ?? "",
                              textAlign: TextAlign.center,
                              style: inputTextStyle,
                            ),
                      (selectedDeliveryPlace == null)
                          ? Container()
                          : heightSpace,
                      Text('Delivery Address',
                          style: primaryColorHeadingTextStyle),
                      heightSpace,
                      Container(
                        width: width - (fixPadding * 4.0),
                        height: 120.0,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              width: 0.8, color: greyColor.withOpacity(0.6)),
                        ),
                        child: TextField(
                          style: inputTextStyle,
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          controller: deliveryAddressController,
                          decoration: InputDecoration(
                            hintText: 'Please enter exact pickup address',
                            hintStyle: inputTextStyle,
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none,
                          ),
                          onChanged: (v) {
                            if (deliveryAddressController.text != '') {
                              setState(() {
                                deliveryAddress = true;
                              });
                            } else {
                              setState(() {
                                deliveryAddress = false;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  // Delivery Address Screen End

  // Confirm Screen Start
  confirmScreenCode() {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomSheet: Wrap(
        children: [
          Material(
            elevation: 7.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: fixPadding * 2.0,
                      left: fixPadding * 2.0,
                      top: fixPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Pickup Start
                      Container(
                        width: (width - (fixPadding * 6.0)) / 2.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pickup',
                              style: blackLargeTextStyle,
                            ),
                            heightSpace,
                            Text(pickupAddressController.text,
                                style: inputTextStyle),
                          ],
                        ),
                      ),
                      // Pickup End
                      // Delivery Start
                      Container(
                        width: (width - (fixPadding * 6.0)) / 2.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery',
                              style: blackLargeTextStyle,
                            ),
                            heightSpace,
                            Text(deliveryAddressController.text,
                                style: inputTextStyle),
                          ],
                        ),
                      ),
                      // Delivery End
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(
                      right: fixPadding * 2.0,
                      left: fixPadding * 2.0,
                      bottom: fixPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Size Start
                      Container(
                        width: (width - (fixPadding * 6.0)) / 2.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Size',
                              style: blackLargeTextStyle,
                            ),
                            heightSpace,
                            Text(
                                '${heightController.text} x ${widthController.text} x ${depthController.text} cm',
                                style: inputTextStyle),
                          ],
                        ),
                      ),
                      // Size End
                      // Weight Start
                      Container(
                        width: (width - (fixPadding * 6.0)) / 2.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Weight',
                              style: blackLargeTextStyle,
                            ),
                            heightSpace,
                            Text('${weightController.text} kg',
                                style: inputTextStyle),
                          ],
                        ),
                      ),
                      // Weight End
                    ],
                  ),
                ),
                Container(
                  color: lightPrimaryColor,
                  padding: EdgeInsets.all(fixPadding),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'Distance: ${(calculateDistance(selectedPickupPlace.geometry.location.lat, selectedPickupPlace.geometry.location.lng, selectedDeliveryPlace.geometry.location.lat, selectedDeliveryPlace.geometry.location.lng)).toStringAsFixed(2)} km',
                          style: primaryColorHeadingTextStyle),
                      SizedBox(height: 5.0),
                      Text('Price: \$15', style: primaryColorHeadingTextStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: RouteMap(
          sourceLat: selectedPickupPlace.geometry.location.lat,
          sourceLang: selectedPickupPlace.geometry.location.lng,
          destinationLat: selectedDeliveryPlace.geometry.location.lat,
          destinationLang: selectedDeliveryPlace.geometry.location.lng),
    );
  }
  // Confirm Screen End

  // Back Button Start
  backButton() {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        if (packageSizeWeightScreen) {
          setState(() {
            packageTypeScreen = true;
            packageSizeWeightScreen = false;
          });
        }
        if (selectPickUpAddressScreen) {
          setState(() {
            selectPickUpAddressScreen = false;
            packageSizeWeightScreen = true;
          });
        }

        if (selectDeliveryAddressScreen) {
          setState(() {
            selectDeliveryAddressScreen = false;
            selectPickUpAddressScreen = true;
          });
        }

        if (confirmScreen) {
          setState(() {
            confirmScreen = false;
            selectDeliveryAddressScreen = true;
          });
        }
      },
      child: Container(
        width: (width - (fixPadding * 6.0)) / 2.0,
        padding: EdgeInsets.all(fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 1.0, color: blackColor),
        ),
        child: Text('Back', style: blackLargeTextStyle),
      ),
    );
  }
  // Back Button End

  // Continue Button Start
  continueButton() {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        if (packageTypeScreen) {
          if (documents || parcel) {
            setState(() {
              packageTypeScreen = false;
              packageSizeWeightScreen = true;
            });
          }
        } else if (packageSizeWeightScreen) {
          if (height && widthInput && depth && weight) {
            setState(() {
              packageSizeWeightScreen = false;
              selectPickUpAddressScreen = true;
            });
          }
        } else if (selectPickUpAddressScreen) {
          if (pickupAddress && selectedPickupPlace != null) {
            setState(() {
              selectPickUpAddressScreen = false;
              selectDeliveryAddressScreen = true;
            });
          }
        } else if (selectDeliveryAddressScreen) {
          if (deliveryAddress && selectedDeliveryPlace != null) {
            setState(() {
              selectDeliveryAddressScreen = false;
              confirmScreen = true;
            });
          }
        } else if (confirmScreen) {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft, child: Payment()));
        }
      },
      child: Container(
        width: (width - (fixPadding * 6.0)) / 2.0,
        padding: EdgeInsets.all(fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            width: 1.0,
            color: (packageTypeScreen)
                ? (documents || parcel)
                    ? primaryColor
                    : greyColor
                : (packageSizeWeightScreen)
                    ? (height && widthInput && depth && weight)
                        ? primaryColor
                        : greyColor
                    : (selectPickUpAddressScreen)
                        ? (pickupAddress && selectedPickupPlace != null)
                            ? primaryColor
                            : greyColor
                        : (selectDeliveryAddressScreen)
                            ? (deliveryAddress && selectedDeliveryPlace != null)
                                ? primaryColor
                                : greyColor
                            : (confirmScreen)
                                ? primaryColor
                                : greyColor,
          ),
          color: (packageTypeScreen)
              ? (documents || parcel)
                  ? primaryColor
                  : greyColor
              : (packageSizeWeightScreen)
                  ? (height && widthInput && depth && weight)
                      ? primaryColor
                      : greyColor
                  : (selectPickUpAddressScreen)
                      ? (pickupAddress && selectedPickupPlace != null)
                          ? primaryColor
                          : greyColor
                      : (selectDeliveryAddressScreen)
                          ? (deliveryAddress && selectedDeliveryPlace != null)
                              ? primaryColor
                              : greyColor
                          : (confirmScreen)
                              ? primaryColor
                              : greyColor,
        ),
        child: Text((confirmScreen) ? 'Pay' : 'Continue',
            style: whiteLargeTextStyle),
      ),
    );
  }
  // Continue Button End
}
