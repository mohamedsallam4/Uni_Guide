import 'package:flutter_bloc/flutter_bloc.dart';
import 'matchmaking_state.dart';

class MatchmakingCubit extends Cubit<MatchmakingState> {
  MatchmakingCubit() : super(MatchmakingInitial());
}