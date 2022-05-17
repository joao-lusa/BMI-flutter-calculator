import 'dart:math';

import 'package:bmicalculatorapp/container_box.dart';
import 'package:bmicalculatorapp/data_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeColor = Color(0xff0073dd);
const inActiveColor = Color(0xFF212121);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  int height = 180;
  int weight = 70;
  int age = 25;
  String result = "";
  String resultDetail = "Result here";
  double bmi = 0;

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  String calculateBmi(int weight, int height) {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25) {
      return 'You Have a higher than nomal boby weight. try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have a nomal boby weigth. Good job!';
    } else {
      return 'You have a lower than normal boby weight. You can eat a bit more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(children: <Widget>[
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateBoxColor(1);
                      });
                    },
                    child: ContainerBox(
                      boxColor: maleBoxColor,
                      childWidget: DataContainer(
                        icon: FontAwesomeIcons.mars,
                        title: 'MALE',
                      ),
                    ))),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateBoxColor(2);
                      });
                    },
                    child: ContainerBox(
                      boxColor: femaleBoxColor,
                      childWidget: DataContainer(
                        icon: FontAwesomeIcons.venus,
                        title: 'FEMALE',
                      ),
                    ))),
          ])),
          Expanded(
            child: ContainerBox(
              boxColor: inActiveColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: textStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        'cm',
                        style: textStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: activeColor,
                    inactiveColor: inActiveColor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(children: <Widget>[
            Expanded(
                child: ContainerBox(
              boxColor: inActiveColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'WEIGHT',
                    style: textStyle1,
                  ),
                  Text(
                    weight.toString(),
                    style: textStyle2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                        backgroundColor: activeColor,
                        child: Icon(FontAwesomeIcons.plus, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            if (weight > 0) {
                              weight--;
                            }
                          });
                        },
                        backgroundColor: activeColor,
                        child:
                            Icon(FontAwesomeIcons.minus, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Expanded(
                child: ContainerBox(
              boxColor: inActiveColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'AGE',
                    style: textStyle1,
                  ),
                  Text(
                    age.toString(),
                    style: textStyle2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                        backgroundColor: activeColor,
                        child: Icon(FontAwesomeIcons.plus, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            if (age > 0) {
                              age--;
                            }
                          });
                        },
                        backgroundColor: activeColor,
                        child:
                            Icon(FontAwesomeIcons.minus, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ])),
          GestureDetector(
              onTap: () {
                setState(() {
                  result = calculateBmi(weight, height);
                  resultDetail = getInterpretation(bmi);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: inActiveColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            color: inActiveColor,
                            height: 200.0,
                            margin: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Result',
                                  style: textStyle1,
                                ),
                                Text(
                                  result.toString(),
                                  style: textStyle2,
                                ),
                                Text(
                                  resultDetail,
                                  style: textStyle1,
                                )
                              ],
                            ),
                          ),
                        );
                      });
                });
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Calcuate',
                    style: textStyle3,
                  ),
                ),
                width: double.infinity,
                height: 80.0,
                color: activeColor,
                margin: EdgeInsets.only(top: 10.0),
              ))
        ],
      ),
    );
  }
}
//29:46


//31