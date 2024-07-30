class SerieImages {
  SerieImages({
    required this.backdrops,
    required this.id,
    required this.logos,
    required this.posters,
  });

  final List<Backdrop> backdrops;
  final int id;
  final List<Backdrop> logos;
  final List<Backdrop> posters;

  factory SerieImages.fromJson(Map<String, dynamic> json) {
    return SerieImages(
      backdrops: json["backdrops"] == null
          ? []
          : List<Backdrop>.from(
              json["backdrops"]!.map((x) => Backdrop.fromJson(x))),
      id: json["id"] ?? 0,
      logos: json["logos"] == null
          ? []
          : List<Backdrop>.from(
              json["logos"]!.map((x) => Backdrop.fromJson(x))),
      posters: json["posters"] == null
          ? []
          : List<Backdrop>.from(
              json["posters"]!.map((x) => Backdrop.fromJson(x))),
    );
  }
}

class Backdrop {
  Backdrop({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  final double aspectRatio;
  final int height;
  final String iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  factory Backdrop.fromJson(Map<String, dynamic> json) {
    return Backdrop(
      aspectRatio: json["aspect_ratio"] ?? 0.0,
      height: json["height"] ?? 0,
      iso6391: json["iso_639_1"] ?? "",
      filePath: json["file_path"] ?? "",
      voteAverage: json["vote_average"] ?? 0.0,
      voteCount: json["vote_count"] ?? 0,
      width: json["width"] ?? 0,
    );
  }
}
