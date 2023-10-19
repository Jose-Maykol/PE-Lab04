import 'package:flutter/material.dart';
import 'package:pe_lab04/colors.dart';
import 'package:pe_lab04/widgets/button.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '3x2',
                  style: TextStyle(
                    fontSize: 36,
                    color: AppColor.fontSecondary
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '6',
                  style: TextStyle(
                    fontSize: 80,
                    color: AppColor.fontPrimary
                  ),
                ),
              ],
            )
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  Button(
                    text: 'CE',
                    color: AppColor.primary,
                  ),
                  Button(
                    text: 'C',
                    color: AppColor.primary,
                  ),
                  Button(
                    text: '%',
                    color: AppColor.secondary,
                  ),
                  Button(
                    text: '÷',
                    color: AppColor.secondary,
                  ),
                  Button(
                    text: '7',
                  ),
                  Button(
                    text: '8',
                  ),
                  Button(
                    text: '9',
                  ),
                  Button(
                    text: '×',
                    color: AppColor.secondary,
                  ),
                  Button(
                    text: '4',
                  ),
                  Button(
                    text: '5',
                  ),
                  Button(
                    text: '6',
                  ),
                  Button(
                    text: '-',
                    color: AppColor.secondary,
                  ),
                  Button(
                    text: '1',
                  ),
                  Button(
                    text: '2',
                  ),
                  Button(
                    text: '3',
                  ),
                  Button(
                    text: '+',
                    color: AppColor.secondary,
                  ),
                  Button(
                    text: '⌫',
                    color: AppColor.primary,
                  ),
                  Button(
                    text: '0',
                  ),
                  Button(
                    text: '.',
                  ),
                  Button(
                    text: '=',
                    color: AppColor.primary,
                  ),
                ],
              ),
            ),
          )
        ]
      )
    );
  }
}
