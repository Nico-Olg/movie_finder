import 'dart:convert';

class GenreList {
    List<Genre> genres;

    GenreList({
        required this.genres,
    });

    factory GenreList.fromJson(String str) => GenreList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GenreList.fromMap(Map<String, dynamic> json) => GenreList(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toMap())),
    };
}

class Genre {
    int id;
    String name;

    Genre({
        required this.id,
        required this.name,
    });

    factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
    };
}
