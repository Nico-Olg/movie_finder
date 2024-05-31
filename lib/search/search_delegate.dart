import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar Película';
 
  int id = 0;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed('home');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    int? genreId = id;
    if (genreId != null) {
      moviesProvider.moviesByGenre(genreId);
      return StreamBuilder(
        stream: moviesProvider.genresuggestionsStream,
        builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
          if (!snapshot.hasData) return _emptyContainer();

          final movies = snapshot.data;

          return ListView.builder(
            itemCount: movies?.length,
            itemBuilder: (_, int index) => _MovieItem(movies![index]),
          );
        },
      );
    }

    return _emptyContainer();
  }

  Widget _emptyContainer() {
    return Container(
      child: const Center(
        child: Icon(Icons.movie_creation_outlined,
            color: Colors.black38, size: 130),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    if (query.isEmpty) {
      if (moviesProvider.genres.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return Column(
        children: [
          Wrap(
            spacing: 8.0,
            children: moviesProvider.genres.map((genre) {
              return ActionChip(
                label: Text(genre.name.toString()),
                onPressed: () {
                  id = genre.id;
                  query= genre.name.toString();
                  showResults(context);
                 
                },
              );
            }).toList(),
          ),
          Expanded(child: _emptyContainer()),
        ],
      );
    }

    moviesProvider.getSuggestionsByQuery(query);

    return StreamBuilder(
        stream: moviesProvider.suggestionStream,
        builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
          if (!snapshot.hasData) return _emptyContainer();

          final movies = snapshot.data;

          return ListView.builder(
              itemCount: movies?.length,
              itemBuilder: (_, int index) => _MovieItem(movies![index]));
        });
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  const _MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${movie.id}';
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movie.fullPosterImg),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalLanguage),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}
