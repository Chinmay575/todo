// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'addtasks_bloc.dart';

class AddtasksState {
  String name;
  String? desc = '';
  Color? color = Colors.black;
  AddtasksState({
    required this.name,
    this.desc,
    this.color,
  });

  AddtasksState copyWith({
    String? name,
    String? desc,
    Color? color,
  }) {
    return AddtasksState(
      name: name ?? this.name,
      desc: desc ?? this.desc,
      color: color ?? this.color,
    );
  }
}