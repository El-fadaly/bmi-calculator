import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  RoundIcon({this.icon, this.onpress});

  final IconData icon;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
    );
  }
}
