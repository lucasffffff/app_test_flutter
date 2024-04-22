import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namer_app/src/favorites/bloc/favorites_bloc.dart';
import '/src/favorites/view/favorites_screen.dart';

class FavoritesPage extends StatelessWidget {

  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesBloc>(
      create: (context) => FavoritesBloc()..add(OnStartedEvent()),
      child: FavoritesScreen(),
    );
  }
}
