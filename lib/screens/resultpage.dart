import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/cardwidget.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/bottomlargebutton.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiInterpretation,
      required this.bmiResult,
      required this.bmiResultLabel});
  final String bmiResultLabel, bmiResult, bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'YOUR RESULT',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: CardWidget(
                  bgcolor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(bmiResultLabel.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: kResultLabelTextStyle),
                      Text(
                        bmiResult,
                        style: kResultTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          bmiInterpretation,
                          textAlign: TextAlign.center,
                          style: kInterpretationTextStyle,
                        ),
                      ),
                    ],
                  ),
                )),
            BottomLargeButton(
                buttonText: 'RE-CALCULATE',
                buttonPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
