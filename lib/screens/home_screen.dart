import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widget/widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(
        context); // Con esta línea, obtengo mi instancia de moviesProvider

    print(moviesProvider.onDisplayMovies);

      final colorFondo = Color.fromARGB(255, 6, 3, 24);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: colorFondo,
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AppBarCustom(),
                    // Tarjetas principales
                    CardSwiper(movies: moviesProvider.onDisplayMovies),
                    // Slider de películas
                    MovieSlider(
                      populares: moviesProvider.popularMovies,
                      title: 'Populares',
                      onNExtPage: () => moviesProvider.getPopularMovies(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Peliculas',
          style: TextStyle(
            fontSize: 40,
            color: getLighterColor(Color.fromARGB(255, 6, 3, 24), 0.25),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        FloatingActionButton(
          backgroundColor: getLighterColor(Color.fromARGB(255, 6, 3, 24), 0.05),
          onPressed: () =>
              showSearch(context: context, delegate: MovieSearchDelegate()),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(200),
              boxShadow: [
                BoxShadow(
                  color: getLighterColor(Color.fromARGB(255, 6, 3, 24), 0.25),
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 12,
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: const Icon(
              Icons.search_outlined,
              color: Colors.white54,
            ),
          ),
        ),
      ],
    );
  }
   Color getLighterColor(Color color, double amount) {
    assert(amount >= 0 && amount <= 1, 'amount must be between 0 and 1');

    final int r = color.red + ((255 - color.red) * amount).round();
    final int g = color.green + ((255 - color.green) * amount).round();
    final int b = color.blue + ((255 - color.blue) * amount).round();

    return Color.fromARGB(color.alpha, r, g, b);
  }
}
