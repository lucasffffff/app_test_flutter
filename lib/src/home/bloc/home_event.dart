part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class OnStartedEvent extends HomeEvent {
  const OnStartedEvent();

  @override
  String toString() => 'OnStartedEvent';

  @override
  List<Object?> get props => [];
}

class AddToFavoriteEvent extends HomeEvent {
  final WordPair palabra;

  const AddToFavoriteEvent({required this.palabra});

  @override
  String toString() => 'AddToFavoriteEvent: ${palabra.asPascalCase}';

  @override
  List<Object?> get props => [palabra];
}

class ToggleFavoriteEvent extends HomeEvent {
  final WordPair word;

  const ToggleFavoriteEvent(this.word);

  @override
  List<Object?> get props => [word];

  @override
  String toString() => 'ToggleFavoriteEvent: ${word.asPascalCase}';
}


class RemoveFromFavoriteEvent extends HomeEvent {
  final WordPair palabra;

  const RemoveFromFavoriteEvent(this.palabra);

  @override
  String toString() => 'RemoveFromFavoriteEvent: ${palabra.asPascalCase}';

  @override
  List<Object?> get props => [palabra];
}

class EventGetNextWord extends HomeEvent {
  final WordPair current;

  EventGetNextWord({required this.current});

  @override
  List<Object?> get props => [current];

  @override
  String toString() => 'EventGetNextWord: ${current.asPascalCase}';
}
