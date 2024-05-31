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
    final moviesProvider = Provider.of<MoviesProvider>(context); // Con esta línea, obtengo mi instancia de moviesProvider

    print(moviesProvider.onDisplayMovies);

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/fondo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
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
            color: Colors.white54,
            fontStyle: FontStyle.italic,
            shadows: [
              Shadow(
                color: Colors.redAccent.shade700,
                blurRadius: 20,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(200),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.shade900,
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 12,
                  blurRadius: 10,
                  offset: Offset(0, 0),
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
}
