import 'package:flutter/material.dart';

import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:bmi_calculator/reusable/custom_appBar.dart';
import 'package:bmi_calculator/reusable/reusable_widgets.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key, required this.title});
  final String title;

  @override
  State<Screen2> createState() => _Screen2();
}

class _Screen2 extends State<Screen2> {
  final _formkey = GlobalKey<FormState>();
  String hint_height = 'metres';
  String hint_weight = 'kg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: customAppBar(
          title: widget.title,
          leading: const Back_Button(),
        ),
        body: Container(
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
                      text: Dimensions.text2,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Container(
                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                DropdownPlaceholder(
                                  parameter: hint_height,
                                  label_place: 'Height',
                                  widget: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.words,
                                      style: const TextStyle(
                                        color: DefinedColors.SURFSIDE,
                                        fontFamily: 'comic',
                                        fontSize: Dimensions.text_field,
                                        letterSpacing: 0,
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        hintText: 'Enter height',
                                        fillColor: Colors.transparent,
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        _formkey.currentState!.save();
                                        return null;
                                      },
                                      onSaved: (String? newValue) =>
                                          setState(() {
                                            // metres
                                            if (hint_height == 'metres') {
                                              obj.height =
                                                  double.parse(newValue!);
                                            }
                                            // feet
                                            else {
                                              obj.height =
                                                  (double.parse(newValue!) * 0.305);
                                            }
                                          })),
                                  dropdown: DropdownButton(
                                    // value: hint_height,
                                    items: <String>['metres', 'feet']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: DefinedColors.WHITE,
                                      size: 25,
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        hint_height = value!;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                DropdownPlaceholder(
                                  parameter: hint_weight,
                                  label_place: 'Weight',
                                  widget: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.words,
                                      style: const TextStyle(
                                        color: DefinedColors.SURFSIDE,
                                        fontFamily: 'comic',
                                        fontSize: Dimensions.text_field,
                                        letterSpacing: 0,
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        hintText: 'Enter weight',
                                        fillColor: Colors.transparent,
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        _formkey.currentState!.save();
                                        return null;
                                      },
                                      onSaved: (String? newValue) =>
                                          setState(() {
                                            // kg
                                            if (hint_weight == 'kg') {
                                            obj.weight =
                                                double.parse(newValue!);
                                            }
                                            // pounds
                                            else {
                                            obj.weight =
                                                double.parse(newValue!) * 0.454;                                              
                                            }
                                          })),

                                  dropdown: DropdownButton(
                                    // itemHeight: 515,
                                    // value: hint_height,
                                    items: <String>['kg', 'pounds']
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: DefinedColors.WHITE,
                                      size: 25,
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        hint_weight = value!;
                                      });
                                    },
                                  ),
                                  // dropdown: IconButton(
                                  //   onPressed: () {},
                                  //   icon: const Icon(
                                  //     Icons.keyboard_arrow_down_sharp,
                                  //   ),
                                  //   color: DefinedColors.WHITE,
                                  //   iconSize: 35,
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),

              // -----------THe BUTTON----------------
              Bottom_Button(
                text: 'Next',
                activity: () {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      _formkey.currentState!.save();
                      _formkey.currentState!.reset();
                      Navigator.pushNamed(context, 'screen3', arguments: obj);
                    });
                  }
                },
              )
            ]))));
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
