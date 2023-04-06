import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/dimensions.dart';
import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget implements PreferredSizeWidget {
  const customAppBar({super.key, required this.title, this.leading, this.color});

  final String? title;
  final Widget? leading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 9),
        color: Colors.transparent,
        child: Stack(children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              title!,
              style:  TextStyle(
                color:(color != null) ? color : DefinedColors.SURFSIDE,
                fontFamily: 'Lora',
                fontSize: Dimensions.app_heading,
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              // left: MediaQuery.of(context).size.width / 10,
              child: leading
              // Container(
              //     // padding: EdgeInsets.all(10),
              //     // height: 45,
              //     // width: 45,
              //     // decoration: BoxDecoration(
              //     //     // color: DefinedColors.GREY_DARK,
              //     //     // borderRadius: BorderRadius.circular(10),
              //     //     boxShadow: [
              //     //       BoxShadow(
              //     //         offset: Offset(0, 0),
              //     //         // blurRadius: 5,
              //     //         // color: DefinedColors.GREY_DARK
              //     //       )
              //     //     ]),
              //     child: leading!),
              )
        ]),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 100);
}
