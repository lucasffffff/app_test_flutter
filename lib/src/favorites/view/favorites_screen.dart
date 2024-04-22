import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namer_app/src/favorites/bloc/favorites_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (previous, current) => current is FavoritesStateUpdate,
    builder: (context, state) {
        print(state);
        // Determinamos el mensaje a mostrar dependiendo del tipo de estado
        String message;
        if (state is FavoritesStateUpdate) {
          // Si el estado es FavoritesStateUpdate, muestro la cantidad de palabras favoritas.
          message =
              'Has agregado a favoritos ${state.favorites.length} palabra/s:';
        } else {
          // Si el estado no es del tipo esperado, mostramos un mensaje indicándolo.
          message = 'El estado actual no permite mostrar favoritos';
        }

        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(message),
            ),
            // Sólo mostramos la lista de favoritos si el estado es el correcto
            if (state is FavoritesStateUpdate)
              for (var pair in state.favorites)
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(pair),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          BlocProvider.of<FavoritesBloc>(context)
                              .add(EventRemoveFromFavorite(pair));

                        },
                      ),
                    ],
                  ),
                ),
          ],
        );
      },
    );
  }
}
