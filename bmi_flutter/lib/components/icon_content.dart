import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({Key? key, required this.innerText, required this.innerIcon})
      : super(key: key);
  String innerText;
  IconData innerIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          innerIcon,
          size: 80.0,
        ),
        Text(
          innerText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
