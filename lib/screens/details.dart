// import 'dart:html';

import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/dimensions.dart';
import 'package:bmi_calculator/model/Person_model.dart';
import 'package:bmi_calculator/screens/screen_4.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/reusable/custom_appBar.dart';
import 'package:bmi_calculator/reusable/reusable_widgets.dart';

import 'home_screen.dart';

class Details_Screen extends StatefulWidget {
  final String title;
  final Person object;
  Details_Screen({super.key, required this.title, required this.object});

  @override
  State<Details_Screen> createState() => _Details_Screen();
}

class _Details_Screen extends State<Details_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: customAppBar(
          title: widget.title,
          leading: const Back_Button(),
        ),
        body: Expanded(
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: Background_Decoration(),
              // color: Colors.amberAccent,
              child: SafeArea(
                  child: Stack(alignment: Alignment.center, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      const Normal_Text(
                        text: Dimensions.text,
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Table(
                        defaultColumnWidth: FixedColumnWidth(MediaQuery.of(context).size.width * 0.4),
                        textDirection: TextDirection.ltr,
                        border: TableBorder(
                            horizontalInside:
                                BorderSide(color: DefinedColors.SURFSIDE),
                            verticalInside:
                                BorderSide(color: DefinedColors.SURFSIDE)),
                        children: [
                          TableRow(children: [
                            TableCellBoldText(text: 'Person',),
                            TableCellLightText(text: '${widget.object.name}',),
                          ]),
                          TableRow(children: [
                            TableCellBoldText(text: 'Age'),
                            TableCellLightText(text: '${widget.object.age}')
                          ]),
                          TableRow(children: [
                            TableCellBoldText(text: 'Height'),
                            TableCellLightText(
                                text:
                                    '${widget.object.height.toStringAsFixed(2)} cm')
                          ]),
                          TableRow(children: [
                            TableCellBoldText(text: 'Weight'),
                            TableCellLightText(
                                text:
                                    '${widget.object.weight.toStringAsFixed(2)} kg')
                          ]),
                          TableRow(children: [
                            TableCellBoldText(text: 'Gender'),
                            TableCellLightText(text: '${widget.object.gender}')
                          ]),
                        ],
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Normal_Text(text: 'BMI'),
                      Text(
                        '${widget.object.bmi.toStringAsFixed(2)}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: DefinedColors.SURFSIDE,
                          fontFamily: 'shippori',
                          fontSize: Dimensions.bmi_digits,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),

                // -----------THe BUTTON----------------
              ]))),
        ));
  }

  BoxDecoration Background_Decoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
          DefinedColors.WHITE,
          DefinedColors.Grey10,
          DefinedColors.GREY_DARK
        ]));
  }
}

class TableCellLightText extends StatelessWidget {
  const TableCellLightText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
            color: DefinedColors.SURFSIDE.withOpacity(0.7), fontSize: 17),
      ),
    );
  }
}

class TableCellBoldText extends StatelessWidget {
  const TableCellBoldText({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: DefinedColors.SURFSIDE,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
