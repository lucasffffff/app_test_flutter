import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_words/english_words.dart';
import 'package:equatable/equatable.dart';
import 'package:namer_app/src/favorites/repository/favorites_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesRepository listaFavs;

  FavoritesBloc({FavoritesRepository? repository})
      : listaFavs = repository ?? FavoritesRepository(),
        super(FavoritesStateInitial()) {
    // Establecemos el estado inicial con los favoritos del repositorio
    on<OnStartedEvent>(_onStarted);
    on<EventRemoveFromFavorite>(_onDeleteFromFavorites);
    on<EventAddToFavorite>(_onAddToFavorites);
    //on<OnToggleFavoriteEvent>(_onToggleFavoriteEvent);
  }

  void _onDeleteFromFavorites(
    EventRemoveFromFavorite event,
    Emitter<FavoritesState> emit,
  ) {
    List<String> favorites = [...listaFavs.favorites];
    favorites.remove(event.word);

    emit(FavoritesStateUpdate(favorites));
    listaFavs.favorites.remove(event.word);
    //emit(FavoritesStateIdle());
  }

  void _onAddToFavorites(
    EventAddToFavorite event,
    Emitter<FavoritesState> emit,
  ) {
    if (!listaFavs.favorites.contains(event.word.toString())) {
      listaFavs.favorites.add(event.word.toString());
      emit(FavoritesStateUpdate(listaFavs.favorites));
    }
  }

  FutureOr<void> _onStarted(
    OnStartedEvent event,
    Emitter<FavoritesState> emit,
  ) {
    emit(FavoritesStateUpdate(listaFavs.favorites));
    //emit(FavoritesStateIdle());
  }

  /*
  void _onToggleFavoriteEvent(
      ToggleFavoriteEvent event,
      Emitter<FavoritesState> emit,
      ) {
    if (listaFavs.favorites.contains(event.word.asLowerCase)) {
      listaFavs.favorites.remove(event.word.asLowerCase);
    } else {
      listaFavs.favorites.add(event.word.asLowerCase);
    }
    emit(FavoritesStateUpdate(listaFavs.favorites));
  }
*/

}

