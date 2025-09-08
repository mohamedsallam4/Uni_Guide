part of 'task_cubit.dart';

sealed class TaskState extends Equatable {
  const TaskState(this.tasklist);
  final List<TaskModel> tasklist;
  @override
  List<Object> get props => [tasklist];
}

final class TaskInitial extends TaskState {
  TaskInitial() : super([]);
}

final class UpdateTasks extends TaskState {
  const UpdateTasks(super.tasklist);
}
