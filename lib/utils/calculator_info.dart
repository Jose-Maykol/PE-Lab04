import 'package:flutter/material.dart';
import 'package:pe_lab04/colors.dart';

class CalculatorInfo {
  final String text;
  final Color? color;

  CalculatorInfo({
    required this.text,
    this.color,
  });
}

List<CalculatorInfo> calculatorInfo = [
  CalculatorInfo(text: 'CE', color: AppColor.primary),
  CalculatorInfo(text: 'C', color: AppColor.primary),
  CalculatorInfo(text: '%', color: AppColor.secondary),
  CalculatorInfo(text: '÷', color: AppColor.secondary),
  CalculatorInfo(text: '7'),
  CalculatorInfo(text: '8'),
  CalculatorInfo(text: '9'),
  CalculatorInfo(text: '×', color: AppColor.secondary),
  CalculatorInfo(text: '4'),
  CalculatorInfo(text: '5'),
  CalculatorInfo(text: '6'),
  CalculatorInfo(text: '-', color: AppColor.secondary),
  CalculatorInfo(text: '1'),
  CalculatorInfo(text: '2'),
  CalculatorInfo(text: '3'),
  CalculatorInfo(text: '+', color: AppColor.secondary),
  CalculatorInfo(text: '⌫', color: AppColor.primary),
  CalculatorInfo(text: '0'),
  CalculatorInfo(text: '.'),
  CalculatorInfo(text: '=', color: AppColor.primary),
];