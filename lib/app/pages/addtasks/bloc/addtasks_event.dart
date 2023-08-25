// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'addtasks_bloc.dart';

abstract class AddtasksEvent {}

class GetTaskNameEvent extends AddtasksEvent {
  final String task;
  GetTaskNameEvent({
    required this.task,
  });
}
