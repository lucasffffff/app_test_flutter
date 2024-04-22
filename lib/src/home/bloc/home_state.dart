part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class WordChangedState extends HomeState {
  final WordPair wordpair;
  final bool isFavorite;

  WordChangedState({required this.wordpair, required this.isFavorite});
}