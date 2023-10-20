import 'package:flutter/material.dart';
import 'package:pe_lab04/colors.dart';
import 'package:pe_lab04/utils/calculator_info.dart';
import 'package:pe_lab04/widgets/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String primaryDisplay = '0';
  String secondaryDisplay = '';
  String operator = '';

  void onDigitPress(String digit) {
    // print(digit);
    setState(() {
      if (primaryDisplay == '0') {
        primaryDisplay = digit;
      } else {
        primaryDisplay += digit;
      }
    });
  }

  void onEqualPress() {
    // print('=');
    var tempDisplay = primaryDisplay;

    if (operator != '' && primaryDisplay != '0') {
      var firstOperand = double.parse(
          secondaryDisplay.substring(0, secondaryDisplay.length - 2));
      var secondOperand = double.parse(primaryDisplay);
      double preResult;
      String result = '';

      switch (operator) {
        case '÷':
          preResult = firstOperand / secondOperand;
          result = preResult == preResult.toInt()
              ? preResult.toInt().toString()
              : preResult.toStringAsFixed(5);
          break;
        case '×':
          preResult = firstOperand * secondOperand;
          result =
              (preResult == preResult.toInt() ? preResult.toInt() : preResult)
                  .toString();
          break;
        case '-':
          preResult = firstOperand - secondOperand;
          result =
              (preResult == preResult.toInt() ? preResult.toInt() : preResult)
                  .toString();
          break;
        case '+':
          preResult = firstOperand + secondOperand;
          result =
              (preResult == preResult.toInt() ? preResult.toInt() : preResult)
                  .toString();
          break;
      }

      setState(() {
        primaryDisplay = result;
        secondaryDisplay += '$tempDisplay =';
        operator = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text(
                    secondaryDisplay,
                    style: const TextStyle(
                      fontSize: 36,
                      color: AppColor.fontSecondary,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text(
                    primaryDisplay,
                    style: const TextStyle(
                      fontSize: 80,
                      color: AppColor.fontPrimary,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final buttonInfo = calculatorInfo[index];
                  return CalculatorButton(
                    onPressed: () {
                      if (buttonInfo.text == 'C') {
                        setState(() {
                          primaryDisplay = '0';
                          secondaryDisplay = '';
                          operator = '';
                        });
                      } else if (buttonInfo.text == 'CE') {
                        setState(() {
                          if (secondaryDisplay.endsWith('=')) {
                            primaryDisplay = '0';
                            secondaryDisplay = '';
                            operator = '';
                          } else {
                            primaryDisplay = '0';
                          }
                        });
                      } else if (buttonInfo.text == '%') {
                        setState(() {
                          primaryDisplay =
                              (double.parse(primaryDisplay) / 100).toString();
                        });
                      } else if (buttonInfo.text == '÷') {
                        setState(() {
                          secondaryDisplay = '$primaryDisplay ÷ ';
                          primaryDisplay = '0';
                          operator = '÷';
                        });
                      } else if (buttonInfo.text == '×') {
                        setState(() {
                          secondaryDisplay = '$primaryDisplay × ';
                          primaryDisplay = '0';
                          operator = '×';
                        });
                      } else if (buttonInfo.text == '-') {
                        setState(() {
                          secondaryDisplay = '$primaryDisplay - ';
                          primaryDisplay = '0';
                          operator = '-';
                        });
                      } else if (buttonInfo.text == '+') {
                        setState(() {
                          secondaryDisplay = '$primaryDisplay + ';
                          primaryDisplay = '0';
                          operator = '+';
                        });
                      } else if (buttonInfo.text == '⌫') {
                        setState(() {
                          if (primaryDisplay.isNotEmpty) {
                            primaryDisplay = primaryDisplay.substring(
                                0, primaryDisplay.length - 1);
                            if (primaryDisplay.isEmpty) {
                              primaryDisplay = '0';
                            }
                          }
                        });
                      } else if (buttonInfo.text == '.') {
                        setState(() {
                          primaryDisplay += '.';
                        });
                      } else if (buttonInfo.text == '=') {
                        onEqualPress();
                      } else {
                        onDigitPress(buttonInfo.text);
                      }
                    },
                    text: buttonInfo.text,
                    color: buttonInfo.color,
                  );
                },
                itemCount: calculatorInfo.length,
              ),
            ),
          )
        ]));
  }
}
