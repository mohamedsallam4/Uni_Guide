import 'package:equatable/equatable.dart';
import '../models/university.dart';

abstract class DirectoryState extends Equatable {
  const DirectoryState();

  @override
  List<Object?> get props => [];
}

class DirectoryInitial extends DirectoryState {}

class DirectoryLoading extends DirectoryState {}

class DirectoryLoaded extends DirectoryState {
  final List<University> universities;

  const DirectoryLoaded(this.universities);

  @override
  List<Object?> get props => [universities];
}

class DirectoryError extends DirectoryState {
  final String message;

  const DirectoryError(this.message);

  @override
  List<Object?> get props => [message];
}