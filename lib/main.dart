import 'file:///C:/Users/Fadaly/Documents/Android%20sample/bmi-calculator-flutter/lib/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'screens/inputBage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultPage(),
      },
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: Color(0xff0A0D22),
        scaffoldBackgroundColor: Color(0xff0A0D22),
      ),
    );
  }
}
