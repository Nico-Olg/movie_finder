import 'dart:convert';

import 'package:peliculas/models/models.dart';

class SearchResoponse {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  SearchResoponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchResoponse.fromJson(String str) =>
      SearchResoponse.fromMap(json.decode(str));

  factory SearchResoponse.fromMap(Map<String, dynamic> json) => SearchResoponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
