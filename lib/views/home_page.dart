import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/commons/app_colors.dart';
import 'package:movie_hub/commons/vars.dart';
import 'package:movie_hub/controllers/details_controller.dart';
import 'package:movie_hub/models/discover_movies.dart';
import 'package:movie_hub/models/discover_series.dart';
import 'package:movie_hub/models/tmdb_genreIds.dart';
import 'package:movie_hub/views/details_page.dart';
import 'package:movie_hub/views/film_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DiscoverMovies movies;
  late DiscoverSeries series;
  late List<Genre> generesMovie;
  late List<Genre> generesSeries;

  bool allLoaded = false;
  int selectedType = 0;

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async {
        // get the genere for movies
        generesMovie =
            await DetailsController.getGenresMovie(context.locale.languageCode);

        // get the genere for series
        generesSeries =
            await DetailsController.getGenresSerie(context.locale.languageCode);

        // get discover new movie
        var mov = await Vars.tmdbClient.discover
            .getMovies(language: context.locale.languageCode);

        // get discover new series
        var seri = await Vars.tmdbClient.discover
            .getTvShows(language: context.locale.languageCode);

        series = DiscoverSeries.fromJson(seri as Map<String, dynamic>);
        movies = DiscoverMovies.fromJson(mov as Map<String, dynamic>);

        setState(() {
          allLoaded = true;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            AnimatedToggleSwitch<int>.size(
              current: selectedType,
              values: const [0, 1],
              height: 70,
              indicatorSize: Size.fromWidth(MediaQuery.of(context).size.width),
              iconBuilder: (value) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      value == 0 ? Icons.movie : Icons.tv,
                      color: Colors.white,
                    ),
                    Text(
                      value == 0 ? "Films" : "Serie TV",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ).tr(),
                  ],
                );
              },
              iconAnimationType: AnimationType.onSelected,
              style: ToggleStyle(
                borderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                indicatorColor: AppColors.primaryColor,
              ),
              onChanged: (i) => setState(() => selectedType = i),
            ),
            const SizedBox(height: 20),
            allLoaded
                ? selectedType == 0 // movie type
                    ? ListView.builder(
                        itemCount: movies.results.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return FilmTile(
                            title: movies.results[index].title,
                            description: movies.results[index].overview,
                            imageUrl: movies.results[index].posterPath,
                            rating: movies.results[index].voteAverage,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                      movies.results[index].id, "movie"),
                                ),
                              );
                            },
                            tags: movies.results[index].genreIds
                                .map(
                                  (e) => generesMovie
                                      .firstWhere((element) => element.id == e)
                                      .name,
                                )
                                .join(", "),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: movies.results.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return FilmTile(
                            title: series.results[index].name,
                            description: series.results[index].overview,
                            imageUrl: series.results[index].posterPath,
                            rating: series.results[index].voteAverage,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                      series.results[index].id, "tv"),
                                ),
                              );
                            },
                            tags: series.results[index].genreIds
                                .map(
                                  (e) => generesSeries
                                      .firstWhere((element) => element.id == e)
                                      .name,
                                )
                                .join(", "),
                          );
                        },
                      )
                : Skeletonizer(
                    enabled: !allLoaded,
                    child: ListView.builder(
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return FilmTile.empty();
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
