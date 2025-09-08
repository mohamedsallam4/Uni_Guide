import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  const TaskModel({
    required this.id,
    required this.title,
    required this.iscompleted,
  });

  final String id;
  final String title;
  final bool iscompleted;

  
  TaskModel copyWith({
    String? id,
    String? title,
    bool? iscompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      iscompleted: iscompleted ?? this.iscompleted,
    );
  }

  @override
  List<Object?> get props => [id, title, iscompleted];
}
