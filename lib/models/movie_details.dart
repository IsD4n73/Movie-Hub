class MovieDetails {
  MovieDetails({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final DateTime? releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      adult: json["adult"] ?? false,
      backdropPath: json["backdrop_path"] ?? "",
      belongsToCollection: json["belongs_to_collection"] == null
          ? null
          : BelongsToCollection.fromJson(json["belongs_to_collection"]),
      budget: json["budget"] ?? 0,
      genres: json["genres"] == null
          ? []
          : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      homepage: json["homepage"] ?? "",
      id: json["id"] ?? 0,
      imdbId: json["imdb_id"] ?? "",
      originCountry: json["origin_country"] == null
          ? []
          : List<String>.from(json["origin_country"]!.map((x) => x)),
      originalLanguage: json["original_language"] ?? "",
      originalTitle: json["original_title"] ?? "",
      overview: json["overview"] ?? "",
      popularity: json["popularity"] ?? 0.0,
      posterPath: json["poster_path"] ?? "",
      productionCompanies: json["production_companies"] == null
          ? []
          : List<ProductionCompany>.from(json["production_companies"]!
              .map((x) => ProductionCompany.fromJson(x))),
      productionCountries: json["production_countries"] == null
          ? []
          : List<ProductionCountry>.from(json["production_countries"]!
              .map((x) => ProductionCountry.fromJson(x))),
      releaseDate: DateTime.tryParse(json["release_date"] ?? ""),
      revenue: json["revenue"] ?? 0,
      runtime: json["runtime"] ?? 0,
      spokenLanguages: json["spoken_languages"] == null
          ? []
          : List<SpokenLanguage>.from(
              json["spoken_languages"]!.map((x) => SpokenLanguage.fromJson(x))),
      status: json["status"] ?? "",
      tagline: json["tagline"] ?? "",
      title: json["title"] ?? "",
      video: json["video"] ?? false,
      voteAverage: json["vote_average"] ?? 0.0,
      voteCount: json["vote_count"] ?? 0,
    );
  }
}

class BelongsToCollection {
  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      posterPath: json["poster_path"] ?? "",
      backdropPath: json["backdrop_path"] ?? "",
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

class ProductionCompany {
  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json["id"] ?? 0,
      logoPath: json["logo_path"] ?? "",
      name: json["name"] ?? "",
      originCountry: json["origin_country"] ?? "",
    );
  }
}

class ProductionCountry {
  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  final String iso31661;
  final String name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json["iso_3166_1"] ?? "",
      name: json["name"] ?? "",
    );
  }
}

class SpokenLanguage {
  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  final String englishName;
  final String iso6391;
  final String name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json["english_name"] ?? "",
      iso6391: json["iso_639_1"] ?? "",
      name: json["name"] ?? "",
    );
  }
}
