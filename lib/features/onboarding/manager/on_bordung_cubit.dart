import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);
  final PageController controller = PageController();

  void changePage(int index) {
    emit(index);
  }

  void nextPage() {
    if (state < 2) {
      emit(state + 1);
    }
  }
}