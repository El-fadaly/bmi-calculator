import 'package:flutter/cupertino.dart';

import '../constant.dart';

class CardInput extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onPress;

  const CardInput({@required this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: kCardInputMarginVertical,
          horizontal: kCardInputMarginHorizontal,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: cardChild,
      ),
    );
  }
}
