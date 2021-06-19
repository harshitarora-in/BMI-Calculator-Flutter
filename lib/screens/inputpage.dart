import 'package:bmi_calculator/screens/resultpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/icon_content.dart';
import '../widgets/cardwidget.dart';
import '../constants.dart';
import 'package:bmi_calculator/widgets/roundiconbutton.dart';
import 'package:bmi_calculator/widgets/bottomlargebutton.dart';
import 'package:bmi_calculator/bmibrain.dart';

enum Gender { male, female, empty }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleGenderColor = kInActiveCardColor;
  Color femaleGenderColor = kInActiveCardColor;
  Color maleIconColor = kInActiveColor;
  Color femaleIconColor = kInActiveColor;
  Gender selectedGender = Gender.empty;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('BMI Calculator'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: CardWidget(
                      press: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      bgcolor: selectedGender == Gender.male
                          ? maleGenderColor = kActiveCardColor
                          : maleGenderColor = kInActiveCardColor,
                      cardChild: IconBox(
                        text: 'MALE',
                        cardTextColor: selectedGender == Gender.male
                            ? maleIconColor = kActiveColor
                            : maleIconColor = kInActiveColor,
                        icon: FontAwesomeIcons.mars,
                        iconColor: selectedGender == Gender.male
                            ? maleIconColor = kActiveColor
                            : maleIconColor = kInActiveColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardWidget(
                      press: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      bgcolor: selectedGender == Gender.female
                          ? femaleGenderColor = kActiveCardColor
                          : femaleGenderColor = kInActiveCardColor,
                      cardChild: IconBox(
                          text: 'FEMALE',
                          cardTextColor: selectedGender == Gender.female
                              ? femaleIconColor = kActiveColor
                              : femaleIconColor = kInActiveColor,
                          icon: FontAwesomeIcons.venus,
                          iconColor: selectedGender == Gender.female
                              ? femaleIconColor = kActiveColor
                              : femaleIconColor = kInActiveColor),
                    ),
                  )
                ],
              )),
              Expanded(
                  child: CardWidget(
                bgcolor: kActiveCardColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT', style: kLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: kNumberTextStyle),
                          Text('cm', style: kLabelTextStyle),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xff8d8e98),
                            activeTrackColor: Colors.white,
                            thumbColor: kButtonColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            overlayColor: Color(0x15EB1555),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 24.0),
                            trackHeight: 3.0),
                        child: Slider(
                          min: 120,
                          max: 220,
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                        ),
                      )
                    ]),
              )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: CardWidget(
                          bgcolor: kActiveCardColor,
                          cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('WEIGHT', style: kLabelTextStyle),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        weight.toString(),
                                        style: kNumberTextStyle,
                                      ),
                                      Text('kg', style: kLabelTextStyle)
                                    ]),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: Icon(FontAwesomeIcons.minus),
                                      iconButtonPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                    ),
                                    SizedBox(width: 20.0),
                                    RoundIconButton(
                                      icon: Icon(FontAwesomeIcons.plus),
                                      iconButtonPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ]))),
                  Expanded(
                      child: CardWidget(
                          bgcolor: kActiveCardColor,
                          cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('AGE', style: kLabelTextStyle),
                                Text(
                                  age.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      icon: Icon(FontAwesomeIcons.minus),
                                      iconButtonPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                    ),
                                    SizedBox(width: 20.0),
                                    RoundIconButton(
                                      icon: Icon(FontAwesomeIcons.plus),
                                      iconButtonPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                    )
                                  ],
                                )
                              ]))),
                ],
              )),
              BottomLargeButton(
                buttonText: 'CALCULATE',
                buttonPressed: () {
                  BmiCalculator calc =
                      BmiCalculator(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                bmiResult: calc.returnBmi(),
                                bmiResultLabel: calc.returnBmiLabel(),
                                bmiInterpretation:
                                    calc.returnBmiInterpretation(),
                              )));
                },
              )
            ],
          )),
    );
  }
}
