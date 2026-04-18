abstract class ComparisonState {}

class ComparisonInitial extends ComparisonState {}

class ComparisonLoading extends ComparisonState {}

class ComparisonLoaded extends ComparisonState {}

class ComparisonError extends ComparisonState {
  final String message;
  ComparisonError(this.message);
}