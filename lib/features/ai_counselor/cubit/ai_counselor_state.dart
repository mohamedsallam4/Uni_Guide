abstract class AiCounselorState {}

class AiCounselorInitial extends AiCounselorState {}

class AiCounselorLoading extends AiCounselorState {}

class AiCounselorLoaded extends AiCounselorState {}

class AiCounselorError extends AiCounselorState {
  final String message;
  AiCounselorError(this.message);
}