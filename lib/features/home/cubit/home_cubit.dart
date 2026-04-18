import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/home_data.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    emit(HomeLoading());
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      const data = HomeData(
        greeting: 'Welcome to Uni Guide!',
        recommendations: ['Harvard University', 'MIT', 'Stanford'],
      );
      emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}