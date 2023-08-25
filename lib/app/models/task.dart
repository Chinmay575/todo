import 'package:flutter/material.dart';
import 'package:todo/app/widgets/random_color.dart';

class Task {
  String name;
  bool? isCompleted = false;
  final Color color = randomColor();
  Task({
    required this.name,
  });
}
