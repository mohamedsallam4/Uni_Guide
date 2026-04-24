import 'package:bloc_statemanagement/features/favorit/views/favorit_view.dart';
import 'package:bloc_statemanagement/features/news_shine_view/views/news_shine_view.dart';
import 'package:bloc_statemanagement/features/profile/views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/views/home_view.dart';
class NavCubit extends Cubit<int> {
  NavCubit():super(0);

  static NavCubit get(context)=>BlocProvider.of(context);

  void changeNav(int index){
    emit(index);
  }
  List<Widget> Screens=[
    HomeView(),
    NewsShineView(),
    FavoritView(),
    ProfileView()
  ];

}