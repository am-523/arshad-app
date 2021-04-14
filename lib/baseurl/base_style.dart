import 'package:flutter/cupertino.dart';

Widget styleText(var data, var fontSize, var color, var fontWeight, var maxLine,
    var overflow) {
  return Text(
    data,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    ),
    maxLines: maxLine,
    overflow: overflow,
  );
}
