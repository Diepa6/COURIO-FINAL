import 'package:Courio/constant/constant.dart';
import 'package:Courio/pages/login_signup/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color continueButtonColor = Colors.grey[500];
  String phoneNumber = '';
  String phoneIsoCode;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
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
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter your mobile number',
                        style: blackLargeTextStyle,
                      ),
                      heightSpace,
                      heightSpace,
                      Text(
                        'Create an account with your mobile number',
                        style: greySmallTextStyle,
                      ),
                      SizedBox(height: 50.0),
                      Text(
                        'Mobile Number',
                        style: greySmallBoldTextStyle,
                      ),
                      heightSpace,
                      InternationalPhoneNumberInput(
                        textStyle: TextStyle(
                          color: blackColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        autoValidate: false,
                        selectorTextStyle: TextStyle(
                          color: blackColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        initialValue: number,
                        textFieldController: controller,
                        // inputBorder: InputBorder.none,
                        inputDecoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0),
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                            color: greyColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          // border: InputBorder.none,
                        ),
                        selectorType: PhoneInputSelectorType.DIALOG,
                        onInputChanged: (v) {
                          if (controller.text != '') {
                            setState(() {
                              continueButtonColor = primaryColor;
                            });
                          } else {
                            setState(() {
                              continueButtonColor = Colors.grey[500];
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: InkWell(
              onTap: () {
                if (controller.text != '') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OTPScreen()));
                }
              },
              child: AnimatedContainer(
                width: width - fixPadding * 2.0,
                padding: EdgeInsets.all(fixPadding * 1.0),
                duration: Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: continueButtonColor,
                ),
                child: Text(
                  'Continue',
                  style: whiteBottonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
