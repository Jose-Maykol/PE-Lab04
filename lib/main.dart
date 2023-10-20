import 'package:flutter/material.dart';
import 'package:pe_lab04/screens/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen()
    );
  }
}

/* TODO:
  * BUG: números se vuelvan mas pequeños mientras mas números se agreguen ya que rompen el layout

 */