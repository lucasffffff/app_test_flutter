import 'package:bloc/bloc.dart';
import 'package:english_words/english_words.dart';
import 'package:equatable/equatable.dart';
import 'package:namer_app/src/favorites/repository/favorites_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  FavoritesRepository listaFavs;

  HomeBloc({FavoritesRepository? repository})
      : listaFavs = repository ?? FavoritesRepository(),
        super(HomeInitial()) {
    on<EventGetNextWord>(_onNextWordGenerated);
    on<AddToFavoriteEvent>(_onAddToFavorites);
    on<OnStartedEvent>(_onStartedEvent);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
  }

  void _onStartedEvent(
      OnStartedEvent event,
      Emitter<HomeState> emit,
      ) {
    WordPair nextWord = listaFavs.getCurrentWord() ?? WordPair.random();
    bool isFavorite = listaFavs.favorites.contains(nextWord.asLowerCase);
    emit(WordChangedState(wordpair: nextWord, isFavorite: isFavorite));
    listaFavs.setCurrentWord(nextWord);
  }

  void _onNextWordGenerated(
      EventGetNextWord event,
      Emitter<HomeState> emit,
      ) {
    WordPair nextWord = WordPair.random();
    bool isFavorite = listaFavs.favorites.contains(nextWord.asLowerCase);
    emit(WordChangedState(wordpair: nextWord, isFavorite: isFavorite));
    listaFavs.setCurrentWord(nextWord);
  }

  void _onAddToFavorites(
    AddToFavoriteEvent event,
    Emitter<HomeState> emit,
  ) {
    if (!listaFavs.favorites.contains(event.palabra)) {
      listaFavs.favorites.add(event.palabra.toString());
    }
  }

  void _onToggleFavorite(
    ToggleFavoriteEvent event,
    Emitter<HomeState> emit,
  ) {
    if (listaFavs.favorites.contains(event.word.toString())) {
      listaFavs.favorites.remove(event.word.toString());
      emit(WordChangedState(wordpair: event.word, isFavorite: false));
    } else {
      listaFavs.favorites.add(event.word.toString());
      emit(WordChangedState(wordpair: event.word, isFavorite: true));
    }
  }
}
