part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object?> get props => [];
}

class FavoritesStateInitial extends FavoritesState {
  const FavoritesStateInitial();

  @override
  String toString() => 'FavoritesStateInitial';
}

class FavoritesStateIdle extends FavoritesState {
  const FavoritesStateIdle();

  @override
  String toString() => 'FavoritesStateIdle';
}

class FavoritesStateUpdate extends FavoritesState {
  final List<String> favorites;

  const FavoritesStateUpdate(this.favorites);

  @override
  List<Object?> get props => [favorites];

  @override
  bool? get stringify => true;
}

// New state to indicate that favorites are loaded
class FavoritesStateLoaded extends FavoritesState {
  final List<String> favorites;

  const FavoritesStateLoaded(this.favorites);

  @override
  List<Object?> get props => [favorites];

  @override
  String toString() => 'FavoritesLoaded';

}
