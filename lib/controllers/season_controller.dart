import 'package:movie_hub/commons/vars.dart';

import '../models/serie_episodes.dart';

class SeasonController {
  static Future<List<Episode>> getSeasons(
      int id, int seasonNumber, String language) async {
    var json = await Vars.tmdbClient.tvSeasons.getDetails(id, seasonNumber,
        language: language) as Map<String, dynamic>;
    return Episodes.fromJson(json).episodes;
  }
}
