import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namer_app/src/app/bloc/app_bloc.dart';
import 'package:namer_app/src/app/view/app_screen.dart';
import 'package:namer_app/src/favorites/view/favorites_page.dart';
import 'package:namer_app/src/home/view/home_page.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: AppScreen( key:Key('AppScreen'),
        homePage: HomePage(key: GlobalKey()),
        favoritesPage: FavoritesPage(),
      ),
    );
  }
}
