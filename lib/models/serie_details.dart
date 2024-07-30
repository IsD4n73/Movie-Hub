class SerieDetails {
  SerieDetails({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final List<CreatedBy> createdBy;
  final List<dynamic> episodeRunTime;
  final DateTime? firstAirDate;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final DateTime? lastAirDate;
  final TEpisodeToAir? lastEpisodeToAir;
  final String name;
  final TEpisodeToAir? nextEpisodeToAir;
  final List<Network> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<Network> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final List<Season> seasons;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;

  factory SerieDetails.fromJson(Map<String, dynamic> json) {
    return SerieDetails(
      adult: json["adult"] ?? false,
      backdropPath: json["backdrop_path"] ?? "",
      createdBy: json["created_by"] == null
          ? []
          : List<CreatedBy>.from(
              json["created_by"]!.map((x) => CreatedBy.fromJson(x))),
      episodeRunTime: json["episode_run_time"] == null
          ? []
          : List<dynamic>.from(json["episode_run_time"]!.map((x) => x)),
      firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
      genres: json["genres"] == null
          ? []
          : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      homepage: json["homepage"] ?? "",
      id: json["id"] ?? 0,
      inProduction: json["in_production"] ?? false,
      languages: json["languages"] == null
          ? []
          : List<String>.from(json["languages"]!.map((x) => x)),
      lastAirDate: DateTime.tryParse(json["last_air_date"] ?? ""),
      lastEpisodeToAir: json["last_episode_to_air"] == null
          ? null
          : TEpisodeToAir.fromJson(json["last_episode_to_air"]),
      name: json["name"] ?? "",
      nextEpisodeToAir: json["next_episode_to_air"] == null
          ? null
          : TEpisodeToAir.fromJson(json["next_episode_to_air"]),
      networks: json["networks"] == null
          ? []
          : List<Network>.from(
              json["networks"]!.map((x) => Network.fromJson(x))),
      numberOfEpisodes: json["number_of_episodes"] ?? 0,
      numberOfSeasons: json["number_of_seasons"] ?? 0,
      originCountry: json["origin_country"] == null
          ? []
          : List<String>.from(json["origin_country"]!.map((x) => x)),
      originalLanguage: json["original_language"] ?? "",
      originalName: json["original_name"] ?? "",
      overview: json["overview"] ?? "",
      popularity: json["popularity"] ?? 0.0,
      posterPath: json["poster_path"] ?? "",
      productionCompanies: json["production_companies"] == null
          ? []
          : List<Network>.from(
              json["production_companies"]!.map((x) => Network.fromJson(x))),
      productionCountries: json["production_countries"] == null
          ? []
          : List<ProductionCountry>.from(json["production_countries"]!
              .map((x) => ProductionCountry.fromJson(x))),
      seasons: json["seasons"] == null
          ? []
          : List<Season>.from(json["seasons"]!.map((x) => Season.fromJson(x))),
      spokenLanguages: json["spoken_languages"] == null
          ? []
          : List<SpokenLanguage>.from(
              json["spoken_languages"]!.map((x) => SpokenLanguage.fromJson(x))),
      status: json["status"] ?? "",
      tagline: json["tagline"] ?? "",
      type: json["type"] ?? "",
      voteAverage: json["vote_average"] ?? 0.0,
      voteCount: json["vote_count"] ?? 0,
    );
  }
}

class CreatedBy {
  CreatedBy({
    required this.id,
    required this.creditId,
    required this.name,
    required this.originalName,
    required this.gender,
    required this.profilePath,
  });

  final int id;
  final String creditId;
  final String name;
  final String originalName;
  final int gender;
  final String profilePath;

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return CreatedBy(
      id: json["id"] ?? 0,
      creditId: json["credit_id"] ?? "",
      name: json["name"] ?? "",
      originalName: json["original_name"] ?? "",
      gender: json["gender"] ?? 0,
      profilePath: json["profile_path"] ?? "",
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

class TEpisodeToAir {
  TEpisodeToAir({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
  });

  final int id;
  final String name;
  final String overview;
  final double voteAverage;
  final int voteCount;
  final DateTime? airDate;
  final int episodeNumber;
  final String episodeType;
  final String productionCode;
  final int runtime;
  final int seasonNumber;
  final int showId;
  final String stillPath;

  factory TEpisodeToAir.fromJson(Map<String, dynamic> json) {
    return TEpisodeToAir(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      overview: json["overview"] ?? "",
      voteAverage: json["vote_average"] ?? 0.0,
      voteCount: json["vote_count"] ?? 0,
      airDate: DateTime.tryParse(json["air_date"] ?? ""),
      episodeNumber: json["episode_number"] ?? 0,
      episodeType: json["episode_type"] ?? "",
      productionCode: json["production_code"] ?? "",
      runtime: json["runtime"] ?? 0,
      seasonNumber: json["season_number"] ?? 0,
      showId: json["show_id"] ?? 0,
      stillPath: json["still_path"] ?? "",
    );
  }
}

class Network {
  Network({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
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

class Season {
  Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  final DateTime? airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final int seasonNumber;
  final double voteAverage;

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      airDate: DateTime.tryParse(json["air_date"] ?? ""),
      episodeCount: json["episode_count"] ?? 0,
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"] ?? "",
      seasonNumber: json["season_number"] ?? 0,
      voteAverage: json["vote_average"] ?? 0.0,
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
