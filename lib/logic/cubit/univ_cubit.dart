// lib/logic/univ_cubit/univ_cubit.dart

import 'package:bloc_statemanagement/data/repository/university_repository.dart';
import 'package:bloc_statemanagement/logic/cubit/univ_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UnivCubit extends Cubit<UnivState> {
  final UniversityRepository repository;

  UnivCubit(this.repository) : super(const UnivState.initial());

  Future<void> loadByCountry(String country) async {
    final q = country.trim();
    if (q.isEmpty) {
      emit(const UnivState.failure('الرجاء إدخال اسم دولة'));
      return;
    }

    emit(const UnivState.loading());
    try {
      final universties = await repository.fetchUniversitiesByCountry(q);
      emit(UnivState.success(universties));
    } catch (e) {
      // نحاول نعرض رسالة واضحة
      emit(UnivState.failure(e.toString()));
    }
  }
}
