class MultiSearch {
  MultiSearch({
    required this.page,
    required this.results,
  });

  final int page;
  final List<Result> results;

  factory MultiSearch.fromJson(Map<String, dynamic> json) {
    return MultiSearch(
      page: json["page"] ?? 0,
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );
  }
}

class Result {
  Result({
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.video,
    required this.gender,
    required this.knownForDepartment,
    required this.profilePath,
    required this.knownFor,
  });

  final String backdropPath;
  final int id;
  final String name;
  final String originalName;
  final String overview;
  final String posterPath;
  final String mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final DateTime? firstAirDate;
  final double voteAverage;
  final int voteCount;
  final List<String> originCountry;
  final String title;
  final String originalTitle;
  final DateTime? releaseDate;
  final bool video;
  final int gender;
  final String knownForDepartment;
  final String profilePath;
  final List<KnownFor> knownFor;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      backdropPath: json["backdrop_path"] ?? "",
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      originalName: json["original_name"] ?? "",
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"] ?? "",
      mediaType: json["media_type"] ?? "",
      adult: json["adult"] ?? false,
      originalLanguage: json["original_language"] ?? "",
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from(json["genre_ids"]!.map((x) => x)),
      popularity: json["popularity"] ?? 0.0,
      firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
      voteAverage: json["vote_average"] ?? 0.0,
      voteCount: json["vote_count"] ?? 0,
      originCountry: json["origin_country"] == null
          ? []
          : List<String>.from(json["origin_country"]!.map((x) => x)),
      title: json["title"] ?? "",
      originalTitle: json["original_title"] ?? "",
      releaseDate: DateTime.tryParse(json["release_date"] ?? ""),
      video: json["video"] ?? false,
      gender: json["gender"] ?? 0,
      knownForDepartment: json["known_for_department"] ?? "",
      profilePath: json["profile_path"] ?? "",
      knownFor: json["known_for"] == null
          ? []
          : List<KnownFor>.from(
              json["known_for"]!.map((x) => KnownFor.fromJson(x))),
    );
  }
}

class KnownFor {
  KnownFor({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final String backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final DateTime? releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory KnownFor.fromJson(Map<String, dynamic> json) {
    return KnownFor(
      backdropPath: json["backdrop_path"] ?? "",
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      originalTitle: json["original_title"] ?? "",
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"] ?? "",
      mediaType: json["media_type"] ?? "",
      adult: json["adult"] ?? false,
      originalLanguage: json["original_language"] ?? "",
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from(json["genre_ids"]!.map((x) => x)),
      popularity: json["popularity"] ?? 0.0,
      releaseDate: DateTime.tryParse(json["release_date"] ?? ""),
      video: json["video"] ?? false,
      voteAverage: json["vote_average"] ?? 0,
      voteCount: json["vote_count"] ?? 0,
    );
  }
}
