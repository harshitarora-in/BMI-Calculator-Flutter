import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Color bgcolor;
  final Widget? cardChild;
  final Function()? press;
  const CardWidget({
    Key? key,
    required this.bgcolor,
    this.cardChild,
    this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: bgcolor, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
