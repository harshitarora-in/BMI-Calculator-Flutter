import 'dart:math';

class BmiCalculator {
  BmiCalculator({required this.height, required this.weight});
  //in CM
  final int height;
  final int weight;
  double _bmi = 0;

  String returnBmi() {
    _bmi = (weight / (pow((height / 100), 2))); //height is converted in meter
    return _bmi.toStringAsFixed(1);
  }

  String returnBmiLabel() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String returnBmiInterpretation() {
    if (_bmi >= 25) {
      print('1');
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      print('2');
      return 'You have a normal body mass index. Good job!';
    } else {
      print('3');
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
