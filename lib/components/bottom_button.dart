import 'package:flutter/material.dart';

import '../constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonText});
  final Function onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomButtonColor,
        width: double.infinity,
        height: 80.0,
        child: Center(
          child: Text(
            buttonText,
            style: kButtonTextstyle,
          ),
        ),
      ),
    );
  }
}
