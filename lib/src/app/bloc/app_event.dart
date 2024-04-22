part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class EventNavigationButtonPressed extends AppEvent {
  final int index;
  const EventNavigationButtonPressed({required this.index});

  @override
  List<Object?> get props => [index];

  @override
  String toString() => 'EventNavigationButtonPressed { index: $index }';
}