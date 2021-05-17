import 'package:flutter/cupertino.dart';

const cardTextColor = Color(0xFF8D8E98);

class GenderWidget extends StatelessWidget {
  GenderWidget({@required this.icon, @required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: TextStyle(
            color: cardTextColor,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
