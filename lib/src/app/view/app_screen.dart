import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namer_app/src/app/bloc/app_bloc.dart';
import 'package:namer_app/src/favorites/view/favorites_page.dart';
import 'package:namer_app/src/home/view/home_page.dart';

class AppScreen extends StatelessWidget {
  final HomePage homePage;
  final FavoritesPage favoritesPage;
  late final List<Widget> pages;

  AppScreen(
      {required this.homePage,
      required this.favoritesPage,
      Key? key,
      }) {
    pages = [homePage, favoritesPage];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: BlocBuilder<AppBloc, AppState>(
                  buildWhen: (previous, current) =>
                      current is AppStateChangeSelectedIndex,
                  builder: (context, state) {
                    int selectedIndex = 0;

                    if (state is AppStateChangeSelectedIndex) {
                      selectedIndex = state.selectedIndex;
                    }

                    return NavigationRail(
                      extended: constraints.maxWidth > 600,
                      destinations: [
                        NavigationRailDestination(
                          icon: Icon(Icons.home),
                          label: Text('Inicio'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.favorite),
                          label: Text('Favoritos'),
                        ),
                      ],
                      selectedIndex: selectedIndex,
                      onDestinationSelected: (value) {
                        BlocProvider.of<AppBloc>(context)
                            .add(EventNavigationButtonPressed(index: value));
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<AppBloc, AppState>(
                  buildWhen: (previous, current) =>
                      current is AppStateChangeSelectedIndex,
                  builder: (context, state) {
                    int selectedIndex = 0;

                    if (state is AppStateChangeSelectedIndex) {
                      selectedIndex = state.selectedIndex;
                    }

                    return Container(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: (selectedIndex == 1)? favoritesPage : homePage,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
