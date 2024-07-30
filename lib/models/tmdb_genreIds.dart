class TmdbGenreIds {
  TmdbGenreIds({
    required this.genres,
  });

  final List<Genre> genres;

  factory TmdbGenreIds.fromJson(Map<String, dynamic> json) {
    return TmdbGenreIds(
      genres: json["genres"] == null
          ? []
          : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
    );
  }
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
    );
  }
}
