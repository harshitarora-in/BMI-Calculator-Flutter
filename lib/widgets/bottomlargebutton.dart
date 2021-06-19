import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomLargeButton extends StatelessWidget {
  BottomLargeButton({required this.buttonText, required this.buttonPressed});
  final String buttonText;
  final Function() buttonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonPressed,
      child: Container(
        child: Center(child: Text(buttonText, style: kLargeButtonStyle)),
        color: kButtonColor,
        margin: EdgeInsets.only(top: 8.0),
        padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        width: double.infinity,
        height: kBottomNavigationBarHeight,
      ),
    );
  }
}
