import 'dart:math';

import 'package:flutter/material.dart';

Color randomColor()
{
  List<Color> colors = [
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.white,
    Colors.cyan,
    Colors.amber,
    Colors.deepPurple,
  ];
  var randomNumber = Random().nextInt(colors.length);
  if(randomNumber == colors.length) randomNumber = 0;
  return colors[randomNumber];
}