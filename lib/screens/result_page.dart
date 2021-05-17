import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/cardInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmi,
      @required this.bmiResult,
      @required this.bmiResultMessage});

  final String bmi;
  final String bmiResult;
  final String bmiResultMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CardInput(
                color: kActiveCardInputColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      bmi,
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      bmiResultMessage,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BottomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                buttonText: 'RECALCULATE',
              ),
            ),
          ],
        ));
  }
}
