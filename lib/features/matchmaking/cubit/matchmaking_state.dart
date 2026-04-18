abstract class MatchmakingState {}

class MatchmakingInitial extends MatchmakingState {}

class MatchmakingLoading extends MatchmakingState {}

class MatchmakingLoaded extends MatchmakingState {}

class MatchmakingError extends MatchmakingState {
  final String message;
  MatchmakingError(this.message);
}