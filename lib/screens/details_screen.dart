import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widget/casting_cards.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/models.dart';
import '../search/search_delegate.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  //TODO: Cambiar luego por una instancia de movie

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    print(movie.title);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //los slivers son widget que tienen cierto comportamiento pre-programado cuando se hace scroll en el contenido del padre
          _CustomAppBar(movie),
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndTitle(movie),
            _Overview(movie),
            CastingCards(movie.id),
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      //TODO: Revisar el tema de ir hacia atras en los detalles de la pelicula
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, //showSearch(context: context, delegate: MovieSearchDelegate()),
          icon: const Icon(Icons.arrow_back_ios)),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors
              .black12, //al poner el black12, nos aseguramos que aunque la imagen de fonde sea blanca, siempre va a estar un poco mas oscurecida para que el nombre de la pelicula se vea
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            movie.title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullPosterImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;
  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(
                  movie.fullPosterImg,
                ),
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_outline,
                      size: 15,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${movie.voteAverage}',
                      style: textTheme.bodySmall,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Movie movie;
  const _Overview(this.movie);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
      future: moviesProvider.getStreamingInfo(movie.id),
      builder: (context, AsyncSnapshot<StreamingPlatformResponse> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final streamingData = snapshot.data!;
        final country =
            'AR'; // TODO: Colocar el pais en base a donde se encuentre el usuario
        final providers = streamingData.results.toMap()[country];

        if (providers == null) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: const Text(
                'Aun no esta disponible en ninguna plataforma de streaming'),
          );
        }

        final List<dynamic> rent = providers['rent'];
        final List<dynamic> buy = providers['buy'];
        final List<dynamic> flatrate = providers['flatrate'];
        final iconSize = MediaQuery.of(context).size.width * 0.12;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (flatrate.isNotEmpty) ...[
                Text('Disponible en:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var provider in flatrate)
                        Row(
                          children: [
                            IconButton(
                              enableFeedback: false,
                              iconSize: iconSize,
                              icon: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(iconSize * 0.3),
                                child: FadeInImage(
                                  placeholder:
                                      const AssetImage('assets/no-image.jpg'),
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${provider['logo_path']}',
                                  ),
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              onPressed: () async {},
                            ),
                            SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ] else if (rent.isNotEmpty) ...[
                Text('Disponible para Alquilar en:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    for (var provider in rent)
                      Row(
                          children: [
                            IconButton(
                              enableFeedback: false,
                              iconSize: iconSize,
                              icon: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(iconSize * 0.3),
                                child: FadeInImage(
                                  placeholder:
                                      const AssetImage('assets/no-image.jpg'),
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${provider['logo_path']}',
                                  ),
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              onPressed: () async {},
                            ),
                            SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                  ],
                ),
                const SizedBox(height: 10),
              ] else if (buy.isNotEmpty) ...[
                Text('Disponible para Comprar en:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    for (var provider in buy)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/no-image.jpg'),
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${provider['logo_path']}',
                          ),
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),
              ] else ...[
                const Text(
                    'Aun no esta disponible en ninguna plataforma de streaming'),
                const SizedBox(height: 10),
              ],
              Text(
                movie.overview,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
