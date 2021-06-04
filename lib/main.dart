import 'package:Courio/appBehaviour/my_behaviour.dart';
import 'package:Courio/constant/constant.dart';
import 'package:Courio/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courio Pro User',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: primaryColor,
        fontFamily: 'Mukta',
        cursorColor: primaryColor,
        tabBarTheme: TabBarTheme(
          labelColor: greyColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      home: SplashScreen(),
    );
  }
}
