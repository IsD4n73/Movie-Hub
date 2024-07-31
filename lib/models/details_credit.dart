class DetailsCredit {
  DetailsCredit({
    required this.id,
    required this.cast,
    required this.crew,
  });

  final int id;
  final List<Cast> cast;
  final List<Cast> crew;

  factory DetailsCredit.fromJson(Map<String, dynamic> json) {
    return DetailsCredit(
      id: json["id"] ?? 0,
      cast: json["cast"] == null
          ? []
          : List<Cast>.from(json["cast"]!.map((x) => Cast.fromJson(x))),
      crew: json["crew"] == null
          ? []
          : List<Cast>.from(json["crew"]!.map((x) => Cast.fromJson(x))),
    );
  }
}

class Cast {
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.department,
    required this.job,
  });

  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;
  final String department;
  final String job;

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      adult: json["adult"] ?? false,
      gender: json["gender"] ?? 0,
      id: json["id"] ?? 0,
      knownForDepartment: json["known_for_department"] ?? "",
      name: json["name"] ?? "",
      originalName: json["original_name"] ?? "",
      popularity: json["popularity"] ?? 0.0,
      profilePath: json["profile_path"] ?? "",
      castId: json["cast_id"] ?? 0,
      character: json["character"] ?? "",
      creditId: json["credit_id"] ?? "",
      order: json["order"] ?? 0,
      department: json["department"] ?? "",
      job: json["job"] ?? "",
    );
  }
}
