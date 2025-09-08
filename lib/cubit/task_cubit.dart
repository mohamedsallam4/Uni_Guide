import 'package:bloc_statemanagement/Models/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  addTask(String title) {
    final model = TaskModel(id: Uuid().v4(), title: title, iscompleted: false);

    emit(UpdateTasks([...state.tasklist, model]));
  }

  removeTask(String id) {
    final List<TaskModel> newList = state.tasklist
        .where((task) => task.id != id)
        .toList();
    emit(UpdateTasks(newList));
  }

  toggleTask(String id) {
    final List<TaskModel> newList = state.tasklist.map((task) {
      return task.id == id
          ? task.copyWith(iscompleted: !task.iscompleted)
          : task;
    }).toList();
    emit(UpdateTasks(newList));
  }
}
