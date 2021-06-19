import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Icon icon;
  final Function() iconButtonPressed;
  RoundIconButton({required this.icon, required this.iconButtonPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: iconButtonPressed,
      child: icon,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 45.0, height: 45.0),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
