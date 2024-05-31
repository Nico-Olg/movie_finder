import 'dart:convert';

import 'package:peliculas/models/movie.dart';

class SearchByGenre {
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    SearchByGenre({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory SearchByGenre.fromJson(String str) => SearchByGenre.fromMap(json.decode(str));

    

    factory SearchByGenre.fromMap(Map<String, dynamic> json) => SearchByGenre(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    
}



