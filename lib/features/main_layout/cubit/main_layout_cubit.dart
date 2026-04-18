import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(const MainLayoutLoaded(0));

  void changeTab(int index) {
    emit(MainLayoutLoaded(index));
  }
}