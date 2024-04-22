part of 'app_bloc.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class AppStateChangeSelectedIndex extends AppState {
  final int selectedIndex;

  AppStateChangeSelectedIndex({required this.selectedIndex});
}
