// import 'dart:html';

import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/dimensions.dart';
import 'package:bmi_calculator/model/Person_model.dart';
import 'package:bmi_calculator/screens/screen_1.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/reusable/custom_appBar.dart';
import 'package:bmi_calculator/reusable/reusable_widgets.dart';

List<Person> list = [];
Person obj = Person(id: list.length);

class Home_Screen extends StatefulWidget {
  final String title;
  Home_Screen({super.key, required this.title});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: customAppBar(
          title: widget.title,
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: Background_Decoration(),
            // color: Colors.amberAccent,
            child: HomeScreenSafeAreaWidget()));
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

class HomeScreenSafeAreaWidget extends StatelessWidget {
  const HomeScreenSafeAreaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(alignment: Alignment.center, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const Normal_Text(
              text: Dimensions.text,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Image.asset(
                'assets/image_1.png',
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.35,
              ),
            ),
          ],
        ),
      ),

      // -----------THe BUTTON----------------
      Bottom_Button(
        text: 'CREATE',
        activity: () {
          print('object');
          Navigator.pushNamed(context, 'screen1', arguments: obj);
        },
      )

    ]));
  }
}
