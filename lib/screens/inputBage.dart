import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/components/cardInput.dart';
import 'package:bmi_calculator/components/genderWidget.dart';
import 'package:bmi_calculator/components/round_icon.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant.dart';
import '../components/bottom_button.dart';

enum gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender selectedGender;

  int height = 180;
  int weight = 60;
  int age = 18;

  void increaseWeight() {
    setState(() {
      weight++;
    });
  }

  void decreaseWeight() {
    setState(() {
      weight--;
    });
  }

  void increaseAge() {
    setState(() {
      age++;
    });
  }

  void decreaseAge() {
    setState(() {
      age--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              //Gender options
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CardInput(
                        onPress: () {
                          setState(() {
                            selectedGender = gender.male;
                          });
                        },
                        color: selectedGender == gender.male
                            ? kActiveCardInputColor
                            : kInActiveCardInputColor,
                        cardChild: GenderWidget(
                          icon: FontAwesomeIcons.mars,
                          text: "MALE",
                        ),
                      ),
                    ),
                    Expanded(
                      child: CardInput(
                        onPress: () {
                          setState(() {
                            selectedGender = gender.female;
                          });
                        },
                        color: selectedGender == gender.female
                            ? kActiveCardInputColor
                            : kInActiveCardInputColor,
                        cardChild: GenderWidget(
                          icon: FontAwesomeIcons.venus,
                          text: "FEMALE",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Height entry
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(kCardInputMargin),
                  decoration: BoxDecoration(
                      color: kActiveCardInputColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Center(
                        child: Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 30.0,
                          ),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 180,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Weigth & Age
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CardInput(
                        color: kActiveCardInputColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIcon(
                                  icon: FontAwesomeIcons.minus,
                                  onpress: decreaseWeight,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIcon(
                                  icon: FontAwesomeIcons.plus,
                                  onpress: increaseWeight,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: CardInput(
                        color: kActiveCardInputColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIcon(
                                  icon: FontAwesomeIcons.minus,
                                  onpress: decreaseAge,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIcon(
                                  icon: FontAwesomeIcons.plus,
                                  onpress: increaseAge,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Calcute Button
              BottomButton(
                onTap: () {
                  BMIBrain brain = BMIBrain(weight: weight, height: height);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                          bmi: brain.calculateBMI(),
                          bmiResult: brain.getResult(),
                          bmiResultMessage: brain.getResultMessage()),
                    ),
                  );
                },
                buttonText: 'CALCULATE',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
