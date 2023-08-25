// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeEvent {}

class AddTaskEvent extends HomeEvent {
  String task;
  AddTaskEvent({
    required this.task,
  }) : super();
}

class RemoveTaskEvent extends HomeEvent {
 int index;
  RemoveTaskEvent({
    required this.index,
  }) : super();
}
