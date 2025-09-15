import 'package:bloc_statemanagement/data/model/university_model.dart';
import 'package:equatable/equatable.dart';

enum UnivStatus { initial, loading, success, failure }

class UnivState extends Equatable {
  final UnivStatus status;
  final List<University> universities;
  final String? errorMessage;

  const UnivState({
    required this.status,
    this.universities = const [],
    this.errorMessage,
  });

  const UnivState.initial() : this(status: UnivStatus.initial);
  const UnivState.loading() : this(status: UnivStatus.loading);
  const UnivState.success(List<University> universties)
      : this(status: UnivStatus.success, universities: universties);
  const UnivState.failure(String message)
      : this(status: UnivStatus.failure, errorMessage: message);

  @override
  List<Object?> get props => [status, universities, errorMessage];
}
