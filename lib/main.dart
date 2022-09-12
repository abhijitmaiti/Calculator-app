// ignore_for_file: prefer_const_constructors

// import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  String equation = "0";
  String result = "";
  String expression = "";
  double equationFontSize = 60.0;
  double resultFontSize = 40.0;
  Color equationColor = Colors.white;
  Color resultColor = Color.fromARGB(255, 148, 145, 145);

  buttonPressed(String buttonText) {
    if (buttonText == 'c') {
      equation = "0";
      result = "";
      //clear font change
      equationFontSize = 60.0;
      resultFontSize = 40.0;
      equationColor = Colors.white;
      resultColor = Color.fromARGB(255, 148, 145, 145);
    } else if (buttonText == 'delete') {
      equationFontSize = 60.0;
      resultFontSize = 40.0;
      equationColor = Colors.white;
      resultColor = Color.fromARGB(255, 148, 145, 145);

      equation = equation.substring(0, equation.length - 1);
      if (equation == "") {
        equation = "0";
      }
    } else if (buttonText == "=") {
      //font size change
      equationFontSize = 40.0;
      resultFontSize = 60.0;

      equationColor = Color.fromARGB(255, 148, 145, 145);
      resultColor = Colors.white;

      expression = equation;
      expression = expression.replaceAll("÷", "/");
      expression = expression.replaceAll("×", "*");
      expression = expression.replaceAll("+", "+");
      expression = expression.replaceAll("-", "-");
      expression = expression.replaceAll("%", "/100");

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel contextModel = ContextModel();
        result = "${exp.evaluate(EvaluationType.REAL, contextModel)}";
      } catch (e) {
        result = 'error';
      }
    } else {
      if (equation == "0") {
        equation = buttonText;
      } else {
        equation = equation + buttonText;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Calculator'),
            backgroundColor: Colors.black,
            centerTitle: true,
          ),
          body: Container(
            color: Colors.black,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.black,
                        padding: EdgeInsets.fromLTRB(0, 0, 35, 5),
                        alignment: Alignment.bottomRight,
                        child: Text(
                          equation,
                          style: TextStyle(
                              fontSize: equationFontSize, color: equationColor),
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        padding: EdgeInsets.fromLTRB(0, 0, 35, 5),
                        alignment: Alignment.bottomRight,
                        child: Text(
                          result,
                          style: TextStyle(
                              fontSize: resultFontSize, color: resultColor),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Divider(
                    height: 60,
                    color: Colors.grey[800],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                      child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('c');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                'C',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 216, 88, 14)),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('delete');
                                });
                              },
                              // child: Text(
                              //   "⌫",
                              //   style: TextStyle(fontSize: 25),
                              // ),
                              // ignore: sort_child_properties_last
                              child: Icon(
                                Icons.backspace_outlined,
                                color: Color.fromARGB(255, 216, 88, 14),
                                size: 28,
                              ),
                              backgroundColor: Colors.black,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed("%");
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Icon(
                                Icons.percent_outlined,
                                color: Color.fromARGB(255, 216, 88, 14),
                                size: 28,
                              ),
                              backgroundColor: Colors.black,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('÷');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text("÷",
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Color.fromARGB(255, 216, 88, 14),
                                  )),
                              backgroundColor: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('7');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                "7",
                                style: TextStyle(fontSize: 40),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('8');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                "8",
                                style: TextStyle(fontSize: 40),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('9');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                "9",
                                style: TextStyle(fontSize: 40),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('×');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                "×",
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Color.fromARGB(255, 216, 88, 14),
                                ),
                              ),
                              backgroundColor: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('4');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                "4",
                                style: TextStyle(fontSize: 40),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('5');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                "5",
                                style: TextStyle(fontSize: 40),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('6');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                "6",
                                style: TextStyle(fontSize: 40),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('-');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                "-",
                                style: TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 216, 88, 14),
                                ),
                              ),
                              backgroundColor: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('1');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                "1",
                                style: TextStyle(fontSize: 40),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('2');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                "2",
                                style: TextStyle(fontSize: 40),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('3');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                "3",
                                style: TextStyle(fontSize: 40),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  buttonPressed('+');
                                });
                              },
                              // ignore: sort_child_properties_last
                              child: Text(
                                "+",
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Color.fromARGB(255, 216, 88, 14),
                                ),
                              ),
                              backgroundColor: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        color: Colors.black,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    buttonPressed("0");
                                  });
                                },

                                // ignore: sort_child_properties_last
                                child: Text(
                                  "0",
                                  style: TextStyle(fontSize: 40),
                                ),
                                backgroundColor: Colors.black,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    buttonPressed('00');
                                  });
                                },
                                // ignore: sort_child_properties_last
                                child: Text(
                                  "00",
                                  style: TextStyle(fontSize: 40),
                                ),
                                backgroundColor: Colors.black,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    buttonPressed('.');
                                  });
                                },
                                // ignore: sort_child_properties_last
                                child: Text(
                                  ".",
                                  style: TextStyle(fontSize: 40),
                                ),
                                backgroundColor: Colors.black,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    buttonPressed('=');
                                  });
                                },
                                // ignore: sort_child_properties_last
                                child: Text(
                                  "=",
                                  style: TextStyle(fontSize: 40),
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 216, 88, 14),
                              ),
                            ]),
                      )
                    ],
                  )),
                )
              ],
            ),
          ),
        ));
  }
}
