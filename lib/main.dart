// import 'package:bmi_calculator/person_model.dart';
import 'package:bmi_calculator/screens/details.dart';
import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:bmi_calculator/screens/screen_1.dart';
import 'package:bmi_calculator/screens/screen_2.dart';
import 'package:bmi_calculator/screens/screen_3.dart';
import 'package:bmi_calculator/screens/screen_4.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/bmi_controller.dart';

import 'model/Person_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = "BMI Calci";
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, initialRoute: 'screen4',
      routes: {
        '/': (context) => Home_Screen(title: title),
        'screen1': (context) => Screen1(title: title),
        'screen2': (context) => Screen2(title: title),
        'screen3': (context) => Screen3(title: title),
        'screen4': (context) => Screen4(title: title),
        // 'details': (context) => Details_Screen(title: title),
      },
      // home: Screen1(
      //   title: title,
      // ),
    );
  }
}
