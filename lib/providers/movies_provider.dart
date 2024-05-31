import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/helpers/debouncer.dart';
import 'package:peliculas/models/models.dart';

import '../models/credits_response.dart';

class MoviesProvider extends ChangeNotifier {
//para que sea un provider, tengo que extenderlo de ChangeNotifier

  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '086f82d79baa39c576638238f362694a';
//String _apiKey=   'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MmE4MzRjNTdhOGJlNzk2MjkxODMxMjkyNzNhYzJkZiIsInN1YiI6IjY2MjE1NjNlN2EzYzUyMDE2NDRjMWMyZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.z3NBho4sa5o2oBV3sE3UXyRrN3Jm1eBh2zMLvAMXMsY';

  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> movieCast = {};
  List<Genre> genres = []; 
  get fetchGenres => genres;
  Map<int, StreamingPlatformResponse> streamingInfo = {};
  int _popularPage = 0;

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  final StreamController<List<Movie>> _suggestionStreamController =
      StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream =>
      _suggestionStreamController.stream;

  final StreamController<List<Movie>> _genresuggestionsStreamController =
      StreamController.broadcast();
  Stream<List<Movie>> get genresuggestionsStream => _genresuggestionsStreamController.stream;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
    getGenres();
  }

  

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });
    final response = await http.get(url);
    return response.body;
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);

    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (movieCast.containsKey(movieId)) return movieCast[movieId]!;

    print('pidiendo informacion');

    final jsonData = await _getJsonData('3/movie/$movieId/credits');

    final creditRespone = CreditsResponse.fromJson(jsonData);

    movieCast[movieId] = creditRespone.cast;

    return creditRespone.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query,
    });
    final response = await http.get(url);
    final searchResponse = SearchResoponse.fromJson(response.body);

    return searchResponse.results;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchMovies(searchTerm);
      _suggestionStreamController.add(results);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });
    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }

   Future<void> getGenres() async {
    final url = Uri.https(_baseUrl, '3/genre/movie/list', {
      'api_key': _apiKey,
      'language': _language,
    });
    final response = await http.get(url);
    final data = GenreList.fromJson(response.body);
    genres = data.genres.toList();
    notifyListeners();
  }

 void moviesByGenre(int genreId) async {
    final url = Uri.https(_baseUrl, '3/discover/movie', {
      'api_key': _apiKey,
      'language': _language,
      'with_genres': '$genreId',
    });
    final response = await http.get(url);
  
    final results =  SearchByGenre.fromJson(response.body);
      _genresuggestionsStreamController.add(results.results);
  }



  Future<StreamingPlatformResponse> getStreamingInfo(int movieId) async {
    if (streamingInfo.containsKey(movieId)) return streamingInfo[movieId]!;

    final url = Uri.https(_baseUrl, '3/movie/$movieId/watch/providers', {
      'api_key': _apiKey,
    });

    final response = await http.get(url);
    print('pridiendo info de plataformas ');
    if (response.statusCode == 200) {
      final data = StreamingPlatformResponse.fromJson(response.body);
      streamingInfo[movieId] = data  ;
      notifyListeners();
      return data;
    } else {
      throw Exception('Failed to load streaming info');
    }
  }

  
}
