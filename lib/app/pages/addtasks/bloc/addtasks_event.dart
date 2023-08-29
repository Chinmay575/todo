// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'addtasks_bloc.dart';

abstract class AddtasksEvent {}

class GetTaskNameEvent extends AddtasksEvent {
  final String name;
  GetTaskNameEvent({
    required this.name,
  });
}

class GetDescriptionEvent extends AddtasksEvent {
  final String desc;
  GetDescriptionEvent({
    required this.desc,
  });
}

class GetColorEvent extends AddtasksEvent {
  Color color;
  GetColorEvent({
    required this.color,
  });
}

class NavigateToHomePageEvent extends AddtasksEvent {
  final BuildContext context;
  NavigateToHomePageEvent(this.context);
}
