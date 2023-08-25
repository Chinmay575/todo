import 'package:bloc/bloc.dart';

part 'addtasks_event.dart';
part 'addtasks_state.dart';

class AddtasksBloc extends Bloc<AddtasksEvent, AddtasksState> {
  AddtasksBloc() : super(AddtasksState(task: '')) {
    on<GetTaskNameEvent>((event, emit) {
      emit(AddtasksState(task: event.task));
    });
  }
}
