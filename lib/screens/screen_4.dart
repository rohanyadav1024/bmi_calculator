import 'dart:convert';

import 'package:bmi_calculator/screens/details.dart';
import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';

import 'package:bmi_calculator/reusable/custom_appBar.dart';
import 'package:bmi_calculator/reusable/reusable_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';
import '../model/Person_model.dart';

class Screen4 extends StatefulWidget {
  Screen4({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<Screen4> createState() => _Screen4();
}

class _Screen4 extends State<Screen4> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpersondata();
  }

  List<Person> _persons = [];
  // List<bool> _remaining_list = [];

  Future<void> getpersondata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? datastring = prefs.getString('key');
    List list = (datastring == null) ? [] : json.decode(datastring);

    for (dynamic d in list) {
      _persons.add(Person.fromJson(json.decode(d)));
    }

    // print(_persons);
    setState(() {});
  }

  Future<void> removepersondata(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _persons.removeAt(index);
    prefs.setString('key', json.encode(_persons));
    getpersondata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: customAppBar(
          title: widget.title,
        ),
        body: (_persons.isEmpty)
            ? HomeScreenSafeAreaWidget()
            : Stack(children: [
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: Background_Decoration(),
                    // color: Colors.amberAccent,
                    child: SafeArea(
                        child: Stack(alignment: Alignment.center, children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.25),
                              // height: 1000,
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.topLeft,

                              // =================List View===================

                              child: ListView(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        0.2),
                                children: _persons
                                    .map((e) => GestureDetector(
                                          onTap: () {
                                            Person passed =
                                                Person(id: _persons.indexOf(e));
                                            passed = e;
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Details_Screen(
                                                          object: passed,
                                                          title: widget.title,
                                                        )));
                                          },
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 15),
                                              // padding: EdgeInsets.all(10),
                                              alignment: Alignment.centerLeft,
                                              width:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                              height: 70,
                                              // constraints: BoxConstraints(maxWidth: 200),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        offset: Offset(15, 15),
                                                        color: Color.fromARGB(
                                                            70, 55, 55, 55),
                                                        blurRadius: 15)
                                                  ],
                                                  gradient:
                                                      const LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                        DefinedColors.SILTY,
                                                        DefinedColors.WHITE,
                                                      ])),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    flex: 4,
                                                    fit: FlexFit.tight,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            margin: const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 18),
                                                            height: 50,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            140,
                                                                            37,
                                                                            244,
                                                                            255),
                                                                    shape: BoxShape
                                                                        .circle),
                                                            child: Icon(
                                                              // Icons
                                                              //     .person_2_rounded,
                                                              (e.gender ==
                                                                      'Male')
                                                                  ? Icons.person
                                                                  : Icons
                                                                      .person_2_sharp,
                                                              size: 40,
                                                            )),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              (e.name.length <
                                                                      14)
                                                                  ? '${e.name}'
                                                                  : '${e.name.substring(14)}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style:
                                                                  const TextStyle(
                                                                color:
                                                                    DefinedColors
                                                                        .SURFSIDE,
                                                                fontFamily:
                                                                    'Tanor',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 15,
                                                                // letterSpacing: 2,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${e.age} years',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style:
                                                                  const TextStyle(
                                                                color:
                                                                    DefinedColors
                                                                        .SURFSIDE,
                                                                fontFamily:
                                                                    'Tanor',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: Dimensions
                                                                    .normal_text,
                                                                letterSpacing:
                                                                    0.45,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: IconButton(
                                                        onPressed: () {
                                                          print(
                                                              'iconbuttoncheck');
                                                          setState(() {
                                                            removepersondata(
                                                                _persons
                                                                    .indexOf(
                                                                        e));
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .highlight_remove_outlined,
                                                          color: DefinedColors
                                                              .TIERRA,
                                                          size: 30,
                                                        )),
                                                  )
                                                ],
                                              )),
                                        ))
                                    .toList(),
                              ),
                            ),
                          )),

                      // -----------THe BUTTON----------------
                      Bottom_Button(
                        text: 'NEW',
                        activity: () {
                          // obj.name = 'Rohan';
                          // obj.age = 20;
                          Person obj = Person(id: _persons.length);
                          print(obj.id);

                          Navigator.pushNamed(context, 'screen1',
                              arguments: obj);
                        },
                      )
                    ]))),

                // ==========container of top==================

                Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: DefinedColors.SKY_BLUE,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(150)),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 15,
                            blurRadius: 25,
                            color: DefinedColors.SURFSIDE.withOpacity(0.5))
                      ]),
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 38.0, top: 28.0),
                        child: Image.asset(
                          'assets/image_3.png', fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * .59,
                          // height: 300,
                        ),
                      ),
                    ),
                  ]),
                )
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
