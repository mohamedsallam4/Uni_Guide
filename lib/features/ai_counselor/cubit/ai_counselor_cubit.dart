import 'package:flutter_bloc/flutter_bloc.dart';
import 'ai_counselor_state.dart';

class AiCounselorCubit extends Cubit<AiCounselorState> {
  AiCounselorCubit() : super(AiCounselorInitial());
}