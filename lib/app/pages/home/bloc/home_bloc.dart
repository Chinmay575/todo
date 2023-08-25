import 'package:bloc/bloc.dart';

import '../../../models/task.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(tasks: [])) {
    on<AddTaskEvent>(
      (event, emit) {
        
        List<Task> tasks = state.tasks;
        Task newtask =  Task(name: event.task);
        tasks.add(newtask);
        emit(state.copyWith(tasks));
      },
    );
    on<RemoveTaskEvent>(
      (event, emit) {
        List<Task> tasks = state.tasks;
        tasks[event.index].isCompleted = !tasks[event.index].isCompleted!;
        emit(state.copyWith(tasks));
      },
    );
  }
}
