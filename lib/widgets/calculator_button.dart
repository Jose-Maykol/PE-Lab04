import 'package:flutter/material.dart';
import 'package:pe_lab04/colors.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColor.secondary,
      onTap: () => onPressed(),
      child: Ink(
        decoration: BoxDecoration(
          color: color ?? AppColor.surface,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              color: AppColor.fontPrimary
            ),
          ),
        ),
      ),
    );
  }
}