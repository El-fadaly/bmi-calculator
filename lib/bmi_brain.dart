import 'dart:math';

import 'package:flutter/cupertino.dart';

class BMIBrain {
  BMIBrain({@required this.weight, @required this.height});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow((height / 100), 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "overWeight";
    } else if (_bmi >= 18.5) {
      return "normal";
    } else {
      return "underWeight";
    }
  }

  String getResultMessage() {
    if (_bmi >= 25) {
      return "keeep working out ";
    } else if (_bmi >= 18.5) {
      return "you are  great  ";
    } else {
      return "keep eating  more  ";
    }
  }
}
