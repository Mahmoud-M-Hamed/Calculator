import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String? _operator;
  String _textContent = '';
  bool _started = false;
  bool _finished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.blueAccent,
        elevation: 60,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.architecture_sharp,
          size: 45,
          color: Colors.lightBlueAccent,
        ),
        leadingWidth: 18,
        title: const Text(
          'Calculator',
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            fontStyle: FontStyle.italic,
            fontSize: 27,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.chevron_left_outlined,
              color: Colors.black87,
              size: 30,
            ),
            padding: const EdgeInsets.only(right: 8),
            onPressed: () {
              setState(() {
                _operator = '';
                _textContent = '';
                _started = false;
                _finished = false;
              });
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding:
            const EdgeInsets.only(left: 0.5, top: 250, bottom: 8, right: 0.5),
        margin: const EdgeInsets.only(left: 0.5, right: 0.5),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(right: 2, left: 2),
              child: Text(
                _textContent,
                textDirection: TextDirection.ltr,
                maxLines: 2,
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 38,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            const Divider(
              color: Colors.black,
              endIndent: 20,
              indent: 20,
              height: 1.3,
            ),
            Row(
              children: [
                materialButton('7'),
                materialButton('8'),
                materialButton('9'),
                operationMaterialButton('/'),
              ],
            ),
            Row(
              children: [
                materialButton('4'),
                materialButton('5'),
                materialButton('6'),
                operationMaterialButton('-'),
              ],
            ),
            Row(
              children: [
                materialButton('1'),
                materialButton('2'),
                materialButton('3'),
                operationMaterialButton('+'),
              ],
            ),
            Row(
              children: [
                materialButton('0'),
                materialButton('.'),
                operationMaterialButton('='),
                operationMaterialButton('x'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget materialButton(String number) {
    return MaterialButton(
      onPressed: () {
        onPressed(number);
      },
      padding: const EdgeInsets.all(8),
      onLongPress: () {},
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(40)),
      child: Text(
        number,
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 25,
        ),
      ),
    );
  }

  Widget operationMaterialButton(String operation) {
    return MaterialButton(
      onPressed: () {
        onPressed(operation);
      },
      elevation: 15,
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(9),
      child: Text(
        operation,
        style: const TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  void onPressed(String operationB) {
    switch (operationB) {
      case '0':
        {
          onClickNumber('0');
        }
        break;
      case '.':
        {
          onClickNumber('.');
        }
        break;
      case '=':
        {
          onClickEquals();
        }
        break;
      case '+':
        {
          onClickOperator('+');
        }
        break;
      case '-':
        {
          onClickOperator('-');
        }
        break;
      case 'x':
        {
          onClickOperator('x');
        }
        break;
      case '/':
        {
          onClickOperator('/');
        }
        break;
      case '1':
        {
          onClickNumber('1');
        }
        break;
      case '2':
        {
          onClickNumber('2');
        }
        break;
      case '3':
        {
          onClickNumber('3');
        }
        break;
      case '4':
        {
          onClickNumber('4');
        }
        break;
      case '5':
        {
          onClickNumber('5');
        }
        break;
      case '6':
        {
          onClickNumber('6');
        }
        break;
      case '7':
        {
          onClickNumber('7');
        }
        break;
      case '8':
        {
          onClickNumber('8');
        }
        break;
      case '9':
        {
          onClickNumber('9');
        }
        break;
    }
  }

  void onClickNumber(String number) {
    if (!_finished) {
      if (!_started) {
        setState(() {
          _textContent = '';
        });
      }

      if (number == '.') {
        if (_operator == null) {
          if (!_textContent.contains(".")) {
            setState(() {
              if (_textContent.isEmpty) {
                _textContent += '0.';
              } else {
                _textContent += '.';
              }
            });
          }
        } else {
          int operatorIndex = _textContent.indexOf(_operator as Pattern);
          String secondNumber = _textContent.substring(operatorIndex + 1);
          if (!secondNumber.contains(".")) {
            setState(() {
              if (secondNumber.isEmpty) {
                _textContent += '0.';
              } else {
                _textContent += '.';
              }
            });
          }
        }
      } else {
        setState(() {
          _textContent += number;
        });
      }

      if (!_started) _started = true;
    }
  }

  void onClickOperator(String operator) {
    if (_operator == null) {
      _operator = operator;
      setState(() {
        _textContent += _operator!;
      });
      if (!_started) _started = true;
    }
  }

  void onClickEquals() {
    if (_operator != null && !_textContent.endsWith(_operator!)) {
      int operatorIndex = _textContent.indexOf(_operator!);
      num firstNumber = num.parse(_textContent.substring(0, operatorIndex));
      num secondNumber = num.parse(_textContent.substring(operatorIndex + 1));
      num result = 0;
      switch (_operator) {
        case "+":
          result = firstNumber + secondNumber;
          break;
        case "-":
          result = firstNumber - secondNumber;
          break;
        case "x":
          result = firstNumber * secondNumber;
          break;
        case "/":
          result = firstNumber / secondNumber;
          break;
      }

      setState(() {
        _textContent += '=$result';
      });
      _finished = true;
    }
  }
}
