import 'package:flutter/material.dart';

class Task {
  String name;
  bool? isCompleted = false;
  final Color color;
  Task(
    this.color, {
    required this.name,
  });
}
