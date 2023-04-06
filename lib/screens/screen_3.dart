// import 'dart:html';

import 'dart:convert';

import 'package:bmi_calculator/bmi_controller.dart';
import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/dimensions.dart';
import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bmi_calculator/reusable/custom_appBar.dart';
import 'package:bmi_calculator/reusable/reusable_widgets.dart';
import '../model/Person_model.dart';

class Screen3 extends StatefulWidget {
  final String title;
  const Screen3({super.key, required this.title});

  @override
  State<Screen3> createState() => _Screen3();
}

class _Screen3 extends State<Screen3> {
  List<Person> objectList = [];

  @override
  void initState() {
    super.initState();
    // getpersondata();
  }

  Future<void> savedata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? datastring = prefs.getString('key');
    List list = (datastring == null) ? [] : json.decode(datastring);
    list.add(json.encode(obj.toJson()));
    prefs.setString('key', json.encode(list));
  }


  @override
  Widget build(BuildContext context) {
    double bmi = obj.getbmi;

    String healthStatus() {
      if (bmi <= 18.4) {
        return 'Underweight';
      }
      if (bmi <= 24.9) {
        return 'Normal';
      }
      if (bmi <= 39.9) {
        return 'Overweight';
      }
      return 'Obese';
    }

    String range() {
      if (bmi <= 18.4) {
        return 'less than 18.4';
      }
      if (bmi <= 24.9) {
        return '18.5 - 24.9';
      }
      if (bmi <= 39.9) {
        return '25 - 39.9';
      }
      return 'above 40';
    }

    String weight() {
      double ans = 0;
      double h = obj.height * 100; //in cm
      // for males
      if (obj.gender == 'Male') {
        ans = (h - 100 - ((h - 150) / 4));
      }
      // for females
      else {
        ans = (h - 100 - ((h - 150) / 2));
      }
      return '${ans.toStringAsFixed(2)}';
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: customAppBar(
          title: widget.title,
          leading: const Back_Button(),
        ),
        body: Stack(children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: Background_Decoration(),
              // color: Colors.amberAccent,
              child: SafeArea(
                  child: Stack(alignment: Alignment.center, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      const Normal_Text(
                        text: Dimensions.text3,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${obj.getbmi.toStringAsPrecision(4)}\n[${healthStatus()}]',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: DefinedColors.SURFSIDE,
                          fontFamily: 'shippori',
                          fontSize: Dimensions.bmi_digits,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          const Normal_Text(text: 'Range'),
                          DigitDataText(
                            data: range(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Normal_Text(
                              text: 'Healthy weight Ramge for your height'),
                          DigitDataText(data: weight())
                        ],
                      )
                    ],
                  ),
                ),

                // -----------THe BUTTON----------------
                Bottom_Button(
                  text: 'SAVE',
                  activity: () {
                    setState(() {
                      obj.bmi = obj.getbmi;
                      savedata();
                    });
                    Navigator.pushNamed(context, 'screen4');
                    // Navigator.pushNamed(
                    //   context,
                    //   'screen4',
                    // );
                  },
                )
              ]))),
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border.all(
          //         width: 15,
          //         color: bgcolor,
          //       ),
          //       boxShadow: [BoxShadow(color: bgcolor.withOpacity(), spreadRadius: 2, blurRadius: 25,)]),
          // ),
        ]));
  }

  BoxDecoration Background_Decoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
          DefinedColors.WHITE,
          DefinedColors.WHITE,
          DefinedColors.Grey10
        ]));
  }
}
