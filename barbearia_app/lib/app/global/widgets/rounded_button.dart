import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = Colors.cyan,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: Get.width * 0.8,
      height: Get.height * 0.08,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  // Widget newElevatedButton() {
  //   return ElevatedButton(
  //     child: Text(
  //       text,
  //       style: TextStyle(color: textColor),
  //     ),
  //     onPressed: press,
  //     style: ElevatedButton.styleFrom(
  //         primary: color,
  //         // padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
  //         textStyle: TextStyle(
  //             color: textColor, fontSize: 14, fontWeight: FontWeight.w500)),
  //   );
  // }
}
