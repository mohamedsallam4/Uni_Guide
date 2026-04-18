import 'package:equatable/equatable.dart';

abstract class MainLayoutState extends Equatable {
  const MainLayoutState();

  @override
  List<Object?> get props => [];
}

class MainLayoutInitial extends MainLayoutState {}

class MainLayoutLoaded extends MainLayoutState {
  final int selectedIndex;

  const MainLayoutLoaded(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}