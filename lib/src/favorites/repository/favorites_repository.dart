import 'package:english_words/english_words.dart';

class FavoritesRepository {
  List<String> favorites = [];
  WordPair? currentWord;  // Variable to store the current word.

  static final FavoritesRepository _instance = FavoritesRepository._internal();

  factory FavoritesRepository() => _instance;
  FavoritesRepository._internal();

  void setCurrentWord(WordPair word) {
    currentWord = word;
  }

  WordPair? getCurrentWord() {
    return currentWord;
  }
}
