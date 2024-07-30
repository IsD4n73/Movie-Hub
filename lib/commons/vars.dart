import 'package:package_info_plus/package_info_plus.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Vars {
  static String apiKey = "";

  static late V3 tmdbClient;

  static late PackageInfo packageInfo;

  static String imageBaseUrl = "https://image.tmdb.org/t/p/original";
}
