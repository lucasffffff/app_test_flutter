import 'package:flutter/material.dart';
import 'package:namer_app/src/app/view/app_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namer_app/src/favorites/bloc/favorites_bloc.dart';  // Correct import is crucial

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesBloc>(
      create: (context) => FavoritesBloc(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        ),
        home: AppPage(),
      ),
    );
  }
}
