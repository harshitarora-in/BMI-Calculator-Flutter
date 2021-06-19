import 'package:flutter/material.dart';
import '../constants.dart';

class IconBox extends StatelessWidget {
  final String text;
  final Color cardTextColor;
  final IconData icon;
  final Color iconColor;
  IconBox(
      {required this.text,
      required this.icon,
      required this.iconColor,
      required this.cardTextColor});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kIconSize,
          color: iconColor,
        ),
        SizedBox(height: 15.0),
        Text(
          text,
          style: TextStyle(color: cardTextColor, fontSize: 18.0),
        )
      ],
    );
  }
}
