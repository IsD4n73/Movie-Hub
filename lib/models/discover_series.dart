class DiscoverSeries {
  DiscoverSeries({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  factory DiscoverSeries.fromJson(Map<String, dynamic> json) {
    return DiscoverSeries(
      page: json["page"] ?? 0,
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
      totalPages: json["total_pages"] ?? 0,
      totalResults: json["total_results"] ?? 0,
    );
  }
}

class Result {
  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime? firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      adult: json["adult"] ?? false,
      backdropPath: json["backdrop_path"] ?? "",
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from(json["genre_ids"]!.map((x) => x)),
      id: json["id"] ?? 0,
      originCountry: json["origin_country"] == null
          ? []
          : List<String>.from(json["origin_country"]!.map((x) => x)),
      originalLanguage: json["original_language"] ?? "",
      originalName: json["original_name"] ?? "",
      overview: json["overview"] ?? "",
      popularity: json["popularity"] ?? 0.0,
      posterPath: json["poster_path"] ?? "",
      firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
      name: json["name"] ?? "",
      voteAverage: json["vote_average"] ?? 0.0,
      voteCount: json["vote_count"] ?? 0,
    );
  }
}
