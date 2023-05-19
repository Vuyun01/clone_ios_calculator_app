import 'package:calculator_ios_app/constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator IOS App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              alignment: Alignment.centerRight,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.symmetric(vertical: 20),
              // width: double.infinity,
              // color: Colors.amber,
              child: FittedBox(
                  child: Text(
                text,
                style: Theme.of(context).textTheme.headlineLarge,
              ))),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(
                    bgColor: Colors.grey,
                    textColor: Theme.of(context).colorScheme.secondary,
                    btnName: CalButtonLabel.allClear,
                    onTap: allClear,
                  ),
                  _buildButton(
                    bgColor: Colors.grey,
                    textColor: Theme.of(context).colorScheme.secondary,
                    btnName: CalButtonLabel.prefix,
                    onTap: () => calculate(CalButtonLabel.prefix),
                  ),
                  _buildButton(
                    bgColor: Colors.grey,
                    textColor: Theme.of(context).colorScheme.secondary,
                    btnName: CalButtonLabel.percent,
                    onTap: () => calculate(CalButtonLabel.percent),
                  ),
                  _buildButton(
                      textSize: 40,
                      btnName: CalButtonLabel.divide,
                      bgColor: Theme.of(context).colorScheme.tertiary,
                      onTap: () => calculate(CalButtonLabel.divide)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(
                    btnName: CalButtonLabel.seven,
                    onTap: () => calculate(CalButtonLabel.seven),
                  ),
                  _buildButton(
                    btnName: CalButtonLabel.eight,
                    onTap: () => calculate(CalButtonLabel.eight),
                  ),
                  _buildButton(
                    btnName: CalButtonLabel.nine,
                    onTap: () => calculate(CalButtonLabel.nine),
                  ),
                  _buildButton(
                      textSize: 40,
                      btnName: CalButtonLabel.times,
                      bgColor: Theme.of(context).colorScheme.tertiary,
                      onTap: () => calculate(CalButtonLabel.times)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(
                    btnName: CalButtonLabel.four,
                    onTap: () => calculate(CalButtonLabel.four),
                  ),
                  _buildButton(
                    btnName: CalButtonLabel.five,
                    onTap: () => calculate(CalButtonLabel.five),
                  ),
                  _buildButton(
                    btnName: CalButtonLabel.six,
                    onTap: () => calculate(CalButtonLabel.six),
                  ),
                  _buildButton(
                      textSize: 40,
                      btnName: CalButtonLabel.minus,
                      bgColor: Theme.of(context).colorScheme.tertiary,
                      onTap: () => calculate(CalButtonLabel.minus)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(
                    btnName: CalButtonLabel.one,
                    onTap: () => calculate(CalButtonLabel.one),
                  ),
                  _buildButton(
                    btnName: CalButtonLabel.two,
                    onTap: () => calculate(CalButtonLabel.two),
                  ),
                  _buildButton(
                    btnName: CalButtonLabel.three,
                    onTap: () => calculate(CalButtonLabel.three),
                  ),
                  _buildButton(
                      textSize: 40,
                      btnName: CalButtonLabel.add,
                      bgColor: Theme.of(context).colorScheme.tertiary,
                      onTap: () => calculate(CalButtonLabel.add)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(
                    isExpanded: true,
                    btnName: CalButtonLabel.zero,
                    onTap: () => calculate(CalButtonLabel.zero),
                  ),
                  _buildButton(
                    btnName: CalButtonLabel.comma,
                    onTap: () => calculate(CalButtonLabel.comma),
                  ),
                  _buildButton(
                      textSize: 40,
                      btnName: CalButtonLabel.equal,
                      bgColor: Theme.of(context).colorScheme.tertiary,
                      onTap: () => calculate(CalButtonLabel.equal)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  String text = '0';
  String result = '';
  String finalResult = '0';
  String mainOperator = '';
  String subOperator = '';
  double number1 = 0;
  double number2 = 0;

  bool isMathOperator(String value) {
    if (value == CalButtonLabel.add ||
        value == CalButtonLabel.minus ||
        value == CalButtonLabel.percent ||
        value == CalButtonLabel.times ||
        value == CalButtonLabel.divide ||
        value == CalButtonLabel.equal) {
      return true;
    }
    return false;
  }

  void calculate(String value) {
    // print(result);
    if (mainOperator == CalButtonLabel.equal && value == CalButtonLabel.equal) {
      switch (subOperator) {
        case CalButtonLabel.add:
          finalResult = add();
          print('added');
          break;
        case CalButtonLabel.minus:
          finalResult = minus();
          print('minus');
          break;
        case CalButtonLabel.times:
          finalResult = times();
          print('times');
          break;
        case CalButtonLabel.divide:
          finalResult = divide();
          print('divided');
          break;
      }
    } else {
      if (isMathOperator(value)) {
        if (result.isNotEmpty) {
          if (number1 == 0) {
            number1 = double.parse(result);
            // print('num1');
          } else {
            number2 = double.parse(result);
          }
          switch (mainOperator) {
            case CalButtonLabel.add:
              finalResult = add();
              print('added');
              break;
            case CalButtonLabel.minus:
              finalResult = minus();
              print('minus');
              break;
            case CalButtonLabel.times:
              finalResult = times();
              print('times');
              break;
            case CalButtonLabel.divide:
              finalResult = divide();
              print('divided');
              break;
          }
          subOperator = mainOperator;
          mainOperator = value;
          result = '';
        }
      }
    }
    if (value == CalButtonLabel.percent) {
      finalResult = percent();
      // print('abc');
    }
    if (!isMathOperator(value)) {
      if (result.isEmpty) {
        if (value != CalButtonLabel.prefix) {
          result = value == CalButtonLabel.comma ? '0.' : value;
        }
        print('value');
      } else {
        if (result == '0') {
          result = value;
        } else if (value == CalButtonLabel.prefix) {
          result = result.startsWith('-')
              ? result.replaceFirst(RegExp(r'-'), '')
              : '-$result';
        } else {
          if (result.contains(CalButtonLabel.comma)) {
            if (value != CalButtonLabel.comma) {
              result += value;
            }
          } else {
            result += value;
          }
        }
      }
      finalResult = result.isEmpty ? '0' : result;
    }
    setState(() {
      // print('rebuild');
      // print('$number1 - $result');
      text = finalResult;
    });
  }

  String doesContainDecimal(String value) {
    if (value.contains(CalButtonLabel.comma)) {
      List<String> extractedValue = value.split(CalButtonLabel.comma);
      if (!(int.parse(extractedValue[1]) > 0)) {
        return extractedValue[0];
      }
    }
    return value;
  }

  String add() {
    result = (number1 + number2).toString();
    number1 = double.parse(result);
    return doesContainDecimal(result);
  }

  String minus() {
    result = (number1 - number2).toString();
    number1 = double.parse(result);
    return doesContainDecimal(result);
  }

  String times() {
    result = (number1 * number2).toString();
    number1 = double.parse(result);
    return doesContainDecimal(result);
  }

  String divide() {
    result = (number1 / number2).toString();
    number1 = double.parse(result);
    return doesContainDecimal(result);
  }

  String percent() {
    result = (number1 / 100).toString();
    number1 = double.parse(result);
    // print('$number1 - $result');
    return doesContainDecimal(result);
  }

  void allClear() {
    setState(() {
      text = '0';
      result = '';
      finalResult = '0';
      mainOperator = '';
      subOperator = '';
      number1 = 0;
      number2 = 0;
    });
  }

  Widget _buildButton(
      {required String btnName,
      required VoidCallback onTap,
      bool isExpanded = false,
      Color? bgColor,
      Color? textColor,
      double? textSize}) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          alignment: isExpanded ? Alignment.centerLeft : Alignment.center,
          padding: isExpanded
              ? const EdgeInsets.symmetric(vertical: 20, horizontal: 30)
              : const EdgeInsets.all(20),
          minimumSize: Size(isExpanded ? 180 : 80, 80),
          shape: isExpanded
              ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
              : const CircleBorder(),
          backgroundColor: bgColor ?? const Color.fromARGB(255, 84, 80, 80)),
      child: Text(
        btnName,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: textColor ?? Colors.white, fontSize: textSize ?? 30),
      ),
    );
  }
}
