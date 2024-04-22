part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class OnStartedEvent extends FavoritesEvent {
  const OnStartedEvent();
}

class EventAddToFavorite extends FavoritesEvent {
  final WordPair word;

  const EventAddToFavorite(this.word);

  @override
  List<Object> get props => [word];
}

class EventRemoveFromFavorite extends FavoritesEvent {
  final String word;

  const EventRemoveFromFavorite(this.word);

  @override
  List<Object> get props => [word];
}

class EventGetFavoritesList extends FavoritesEvent {
  const EventGetFavoritesList();
}
