// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Task {
  String name;
  String? desc;
  bool? isCompleted;
  Color? color = Colors.black;
  Task({
    required this.name,
    this.desc,
    this.isCompleted = false,
    this.color,
  });

  static Map<String, dynamic> toMap(Task task) {
    return <String, dynamic>{
      'name': task.name,
      'desc': task.desc,
      'isCompleted': task.isCompleted,
      'color': task.color?.value,
    };
  }

  factory Task.fromJson(Map<String, dynamic> data) {
    return Task(
      name: data['name'],
      desc: data['desc'],
      isCompleted: data['isCompleted'],
      color: Color(data['color']),
    );
  }

  static String encode(List<Task> tasks) {
    return json.encode(
      tasks.map<Map<String, dynamic>>((e) => Task.toMap(e)).toList(),
    );
  }

  static List<Task> decode(String tasks) {
    return (json.decode(tasks) as List<dynamic>)
        .map<Task>((item) => Task.fromJson(item))
        .toList();
  }
}
