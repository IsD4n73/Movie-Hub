class Episodes {
    Episodes({
        required this.id,
        required this.airDate,
        required this.episodes,
        required this.name,
        required this.overview,
        required this.episodesId,
        required this.posterPath,
        required this.seasonNumber,
        required this.voteAverage,
    });

    final String id;
    final DateTime? airDate;
    final List<Episode> episodes;
    final String name;
    final String overview;
    final int episodesId;
    final String posterPath;
    final int seasonNumber;
    final double voteAverage;

    factory Episodes.fromJson(Map<String, dynamic> json){ 
        return Episodes(
            id: json["_id"] ?? "",
            airDate: DateTime.tryParse(json["air_date"] ?? ""),
            episodes: json["episodes"] == null ? [] : List<Episode>.from(json["episodes"]!.map((x) => Episode.fromJson(x))),
            name: json["name"] ?? "",
            overview: json["overview"] ?? "",
            episodesId: json["id"] ?? 0,
            posterPath: json["poster_path"] ?? "",
            seasonNumber: json["season_number"] ?? 0,
            voteAverage: json["vote_average"] ?? 0.0,
        );
    }

    @override
    String toString(){
        return "$id, $airDate, $episodes, $name, $overview, $episodesId, $posterPath, $seasonNumber, $voteAverage, ";
    }
}

class Episode {
    Episode({
        required this.airDate,
        required this.episodeNumber,
        required this.id,
        required this.name,
        required this.overview,
        required this.productionCode,
        required this.runtime,
        required this.seasonNumber,
        required this.showId,
        required this.stillPath,
        required this.voteAverage,
        required this.voteCount,
        required this.crew,
        required this.guestStars,
    });

    final DateTime? airDate;
    final int episodeNumber;
    final int id;
    final String name;
    final String overview;
    final String productionCode;
    final int runtime;
    final int seasonNumber;
    final int showId;
    final String stillPath;
    final double voteAverage;
    final int voteCount;
    final List<Crew> crew;
    final List<Crew> guestStars;

    factory Episode.fromJson(Map<String, dynamic> json){ 
        return Episode(
            airDate: DateTime.tryParse(json["air_date"] ?? ""),
            episodeNumber: json["episode_number"] ?? 0,
            id: json["id"] ?? 0,
            name: json["name"] ?? "",
            overview: json["overview"] ?? "",
            productionCode: json["production_code"] ?? "",
            runtime: json["runtime"] ?? 0,
            seasonNumber: json["season_number"] ?? 0,
            showId: json["show_id"] ?? 0,
            stillPath: json["still_path"] ?? "",
            voteAverage: json["vote_average"] ?? 0.0,
            voteCount: json["vote_count"] ?? 0,
            crew: json["crew"] == null ? [] : List<Crew>.from(json["crew"]!.map((x) => Crew.fromJson(x))),
            guestStars: json["guest_stars"] == null ? [] : List<Crew>.from(json["guest_stars"]!.map((x) => Crew.fromJson(x))),
        );
    }

    @override
    String toString(){
        return "$airDate, $episodeNumber, $id, $name, $overview, $productionCode, $runtime, $seasonNumber, $showId, $stillPath, $voteAverage, $voteCount, $crew, $guestStars, ";
    }
}

class Crew {
    Crew({
        required this.department,
        required this.job,
        required this.creditId,
        required this.adult,
        required this.gender,
        required this.id,
        required this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        required this.profilePath,
        required this.character,
        required this.order,
    });

    final String department;
    final String job;
    final String creditId;
    final bool adult;
    final int gender;
    final int id;
    final String knownForDepartment;
    final String name;
    final String originalName;
    final double popularity;
    final String profilePath;
    final String character;
    final int order;

    factory Crew.fromJson(Map<String, dynamic> json){ 
        return Crew(
            department: json["department"] ?? "",
            job: json["job"] ?? "",
            creditId: json["credit_id"] ?? "",
            adult: json["adult"] ?? false,
            gender: json["gender"] ?? 0,
            id: json["id"] ?? 0,
            knownForDepartment: json["known_for_department"] ?? "",
            name: json["name"] ?? "",
            originalName: json["original_name"] ?? "",
            popularity: json["popularity"] ?? 0.0,
            profilePath: json["profile_path"] ?? "",
            character: json["character"] ?? "",
            order: json["order"] ?? 0,
        );
    }

    @override
    String toString(){
        return "$department, $job, $creditId, $adult, $gender, $id, $knownForDepartment, $name, $originalName, $popularity, $profilePath, $character, $order, ";
    }
}
