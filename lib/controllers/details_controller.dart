import 'package:movie_hub/models/serie_details.dart';
import 'package:movie_hub/models/serie_images.dart';

import '../commons/vars.dart';
import '../models/movie_details.dart';
import '../models/movies_images.dart';
import '../models/tmdb_genreIds.dart' as genreIds;

class DetailsController {
  static Future<List<genreIds.Genre>> getGenresMovie(String language) async {
    return genreIds.TmdbGenreIds.fromJson((await Vars.tmdbClient.genres
            .getMovieList(language: language) as Map<String, dynamic>))
        .genres
        .map(
          (e) => e,
        )
        .toList();
  }

  static Future<List<genreIds.Genre>> getGenresSerie(String language) async {
    return genreIds.TmdbGenreIds.fromJson((await Vars.tmdbClient.genres
            .getTvlist(language: language) as Map<String, dynamic>))
        .genres
        .map(
          (e) => e,
        )
        .toList();
  }

  static Future<MovieDetails> getMovieDetails(int id) async {
    var json =
        await Vars.tmdbClient.movies.getDetails(id) as Map<String, dynamic>;
    return MovieDetails.fromJson(json);
  }

  static Future<List<String>> getMovieImage(int id, String languages) async {
    var imageJson = await Vars.tmdbClient.movies
        .getImages(id, includeImageLanguage: languages) as Map<String, dynamic>;

    var imgs = MoviesImages.fromJson(imageJson);

    var links =
        imgs.posters.map((e) => "${Vars.imageBaseUrl}${e.filePath}").toList();

    links.addAll(
      imgs.backdrops.map((e) => "${Vars.imageBaseUrl}${e.filePath}"),
    );

    List<String> images = [];

    for (var url in links) {
      images.add(url);
    }

    return images;
  }

  static Future<SerieDetails> getSerieDetails(int id) async {
    var json = await Vars.tmdbClient.tv.getDetails(id) as Map<String, dynamic>;
    return SerieDetails.fromJson(json);
  }

  static Future<List<String>> getSerieImage(int id, String languages) async {
    var imageJson = await Vars.tmdbClient.tv
        .getImages(id, includeImageLanguage: languages) as Map<String, dynamic>;

    var imgs = SerieImages.fromJson(imageJson);

    var links =
        imgs.posters.map((e) => "${Vars.imageBaseUrl}${e.filePath}").toList();

    links.addAll(
      imgs.backdrops.map((e) => "${Vars.imageBaseUrl}${e.filePath}"),
    );

    List<String> images = [];

    for (var url in links) {
      images.add(url);
    }

    return images;
  }
}
