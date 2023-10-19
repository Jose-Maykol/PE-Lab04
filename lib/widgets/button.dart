import 'package:flutter/material.dart';
import 'package:pe_lab04/colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColor.secondary,
      onTap: () => {
        print(text)
      },
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