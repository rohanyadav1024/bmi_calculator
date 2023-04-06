import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/reusable/custom_appBar.dart';
import 'package:bmi_calculator/reusable/reusable_widgets.dart';

import '../constants/colors.dart';
import '../constants/dimensions.dart';

class Screen1 extends StatefulWidget {
  Screen1({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<Screen1> createState() => _Screen1();
}

class _Screen1 extends State<Screen1> {
  final _formkey = GlobalKey<FormState>();
  String gender = 'Male';

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
                child: Form(
              key: _formkey,
              child: Stack(alignment: Alignment.center, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      const Normal_Text(text: Dimensions.text1),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Container(
                            child: Column(
                              children: [
                                CustomPlaceholderWidget(
                                  label_place: 'Name',
                                  // hint: 'Ex. John',
                                  // formkey_general: _formkey, obj: obj,
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
                                        hintText: 'Ex. John',
                                        fillColor: Colors.transparent,
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        _formkey.currentState!.save();
                                        return null;
                                      },
                                      onSaved: (String? newValue) =>
                                          setState(() {
                                            obj.name = newValue!;
                                          })),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                CustomPlaceholderWidget(
                                  label_place: 'Age',
                                  // hint: '2 - 200 years',
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
                                      hintText: '2 - 200 years',
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
                                      obj.age = int.parse(newValue!);
                                    }),
                                    // onSaved: (newValue) => (newValue != null)? obj.name = newValue: obj.name = '',
                                    // onChanged: (newValue) {
                                    //   obj.name = newValue;
                                    // },
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  //-------------------name placeholder----------------
                                  children: [
                                    const Text(
                                      'Gender',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: DefinedColors.SURFSIDE,
                                        fontFamily: 'Tanor',
                                        fontSize: Dimensions.placeholder_text,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    const SizedBox(height: 10),

                                    // --------------dropdown placeholder------------------
                                    Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          Container(
                                            height: 50,
                                            alignment: Alignment.centerLeft,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            decoration: BoxDecoration(
                                                color: DefinedColors.SILTY,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0),
                                              child: Text(
                                                '$gender',
                                                style: const TextStyle(
                                                  color:
                                                      DefinedColors.SURFSIDE,
                                                  fontFamily: 'comic',
                                                  fontSize:
                                                      Dimensions.text_field,
                                                  letterSpacing: 0,
                                                ),
                                              ),
                                            ),
                                          ),

                                          // -------------------dropdown----------------------
                                          Container(
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            decoration: const BoxDecoration(
                                                color: DefinedColors.BASE_Mud,
                                                borderRadius:
                                                    BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(0),
                                                  topRight:
                                                      Radius.circular(50),
                                                  bottomRight:
                                                      Radius.circular(50),
                                                )),
                                            child: DropdownButton(
                                              // value: hint_height,
                                              items: <String>[
                                                'Male',
                                                'Female'
                                              ].map((String value) {
                                                return DropdownMenuItem<
                                                    String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              icon: const Icon(
                                                Icons
                                                    .keyboard_arrow_down_sharp,
                                                color: DefinedColors.WHITE,
                                                size: 25,
                                              ),
                                              onChanged: (String? value) {
                                                setState(() {
                                                  gender = value!;
                                                });
                                              },
                                            ),
                                          ),
                                        ])
                                  ],
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),

                // -----------THe BUTTON----------------
                Bottom_Button(
                  text: 'NEXT',
                  activity: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      _formkey.currentState!.reset();
                      obj.gender = gender;
                      print(obj.name);
                      Navigator.pushNamed(context, 'screen2', arguments: obj);
                    }
                  },
                )
              ]),
            ))));
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
