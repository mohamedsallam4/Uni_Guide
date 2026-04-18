import 'package:flutter_bloc/flutter_bloc.dart';
import 'comparison_state.dart';

class ComparisonCubit extends Cubit<ComparisonState> {
  ComparisonCubit() : super(ComparisonInitial());
}