import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namer_app/src/home/bloc/home_bloc.dart';
import 'package:namer_app/src/home/widget/big_card.dart';
import 'package:english_words/english_words.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        WordPair currentWordPair = (state is WordChangedState) ? state.wordpair : WordPair.random();
        bool isCurrentFavorite = (state is WordChangedState) ? state.isFavorite : false;

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigCard(pair: currentWordPair, isFavorite: isCurrentFavorite),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context).add(ToggleFavoriteEvent(currentWordPair));
                    },
                    icon: Icon(isCurrentFavorite ? Icons.favorite : Icons.favorite_border),
                    label: Text('Like'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context).add(EventGetNextWord(current: currentWordPair));
                    },
                    child: Text('Siguiente'),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
