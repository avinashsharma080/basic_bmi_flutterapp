import 'package:flutter/material.dart';
import 'dart:math';

class BmiCalculator {
  BmiCalculator({@required this.height, @required this.weight});
  final int height;
  final int weight;
  double _bmi;

  String getBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String interpretation() {
    if (_bmi >= 25) {
      return 'You are Fat ass';
    } else if (_bmi > 18.5) {
      return 'You are fit currently but not for long';
    } else {
      return 'You really need diet dude';
    }
  }
}
