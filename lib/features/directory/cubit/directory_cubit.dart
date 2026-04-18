import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/university.dart';
import 'directory_state.dart';

class DirectoryCubit extends Cubit<DirectoryState> {
  DirectoryCubit() : super(DirectoryInitial()) {
    loadUniversities();
  }

  Future<void> loadUniversities() async {
    emit(DirectoryLoading());
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      const universities = [
        University(
          id: '1',
          name: 'Harvard University',
          location: 'Cambridge, MA',
          description: 'A prestigious university',
        ),
        University(
          id: '2',
          name: 'MIT',
          location: 'Cambridge, MA',
          description: 'Massachusetts Institute of Technology',
        ),
      ];
      emit(DirectoryLoaded(universities));
    } catch (e) {
      emit(DirectoryError(e.toString()));
    }
  }
}