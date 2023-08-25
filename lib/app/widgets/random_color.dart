import 'dart:math';

import 'package:flutter/material.dart';

Color randomColor() {
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
  ];
  var randomNumber = Random().nextInt(colors.length);
  if (randomNumber == colors.length) randomNumber = 0;
  return colors[randomNumber];
}
