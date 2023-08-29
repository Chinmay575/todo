import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/global/init.dart';

import '../../../models/task.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(tasks: [])) {
    on<InitialEvent>(
      (event, emit) async {
        String t = await Global.prefs.getString('tasks');
        List<Task> tasks = Task.decode(t);
        emit(HomeState(tasks: tasks));
      },
    );
    on<AddTaskEvent>(
      (event, emit) async {
        List<Task> tasks = state.tasks;
        Task newtask = Task(
          name: event.task,
          color: event.color,
          desc: event.desc,
        );
        tasks.add(newtask);
        print("Tasks: ");
        print(tasks);
        await Global.prefs.setString('tasks', Task.encode(tasks));
        var t = await Global.prefs.getString('tasks');
        var temp = Task.decode(t);
        for(var i in temp)
        {
          print("I am printed");
          print(i.name);
          print(i.desc);
        }
         print("I am printed 2");
        emit(state.copyWith(temp));
      },
    );
    on<MarkDoneEvent>(
      (event, emit) {
        List<Task> tasks = state.tasks;
        tasks[event.index].isCompleted = !tasks[event.index].isCompleted!;
        emit(state.copyWith(tasks));
      },
    );
    on<RemoveTaskEvent>(
      (event, emit) {
        List<Task> tasks = state.tasks;
        tasks.remove(event.task);
        emit(state.copyWith(tasks));
      },
    );

    on<NavigateToAddTasksPage>(
      (event, emit) => Navigator.of(event.context).pushNamed('/addTasks'),
    );
  }
}
