import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_hub/commons/app_bar.dart';
import 'package:movie_hub/commons/app_colors.dart';
import 'package:movie_hub/models/movie_details.dart';
import 'package:movie_hub/models/movies_images.dart';
import 'package:movie_hub/models/serie_details.dart';
import 'package:movie_hub/views/movie_details.dart';
import 'package:movie_hub/views/serie_details.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:readmore/readmore.dart';

import '../commons/vars.dart';
import '../models/serie_images.dart';
import '../models/tmdb_genreIds.dart' as genreIds;

class DetailsPage extends StatefulWidget {
  final int mediaId;
  final String mediaType;

  const DetailsPage(this.mediaId, this.mediaType, {super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> images = [];
  MovieDetails? detailsMovie;
  SerieDetails? detailsSerie;

  late List<genreIds.Genre> generesMovie;
  late List<genreIds.Genre> generesSeries;
  String selectedImg = "";

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async {
        var cancel = BotToast.showLoading();
        // get the genere for movies
        generesMovie = genreIds.TmdbGenreIds.fromJson((await Vars
                    .tmdbClient.genres
                    .getMovieList(language: context.locale.languageCode)
                as Map<String, dynamic>))
            .genres
            .map(
              (e) => e,
            )
            .toList();

        // get the genere for series
        generesSeries = genreIds.TmdbGenreIds.fromJson((await Vars
                    .tmdbClient.genres
                    .getTvlist(language: context.locale.languageCode)
                as Map<String, dynamic>))
            .genres
            .map(
              (e) => e,
            )
            .toList();

        if (widget.mediaType == "movie") {
          var json = await Vars.tmdbClient.movies.getDetails(widget.mediaId)
              as Map<String, dynamic>;
          detailsMovie = MovieDetails.fromJson(json);

          var imageJson = await Vars.tmdbClient.movies.getImages(widget.mediaId,
                  includeImageLanguage:
                      "${context.supportedLocales.join(",")},null")
              as Map<String, dynamic>;
          MoviesImages imgs = MoviesImages.fromJson(imageJson);

          var links = imgs.posters
              .map((e) => "${Vars.imageBaseUrl}${e.filePath}")
              .toList();

          links.addAll(
            imgs.backdrops.map((e) => "${Vars.imageBaseUrl}${e.filePath}"),
          );

          for (var url in links) {
            images.add(url);
          }

          selectedImg = images.first;

          setState(() {});
        } else {
          var json = await Vars.tmdbClient.tv.getDetails(widget.mediaId)
              as Map<String, dynamic>;
          detailsSerie = SerieDetails.fromJson(json);

          var imageJson = await Vars.tmdbClient.tv.getImages(widget.mediaId,
                  includeImageLanguage:
                      "${context.supportedLocales.join(",")},null")
              as Map<String, dynamic>;
          SerieImages imgs = SerieImages.fromJson(imageJson);

          var links = imgs.posters
              .map((e) => "${Vars.imageBaseUrl}${e.filePath}")
              .toList();

          links.addAll(
            imgs.backdrops.map((e) => "${Vars.imageBaseUrl}${e.filePath}"),
          );

          for (var url in links) {
            images.add(url);
          }

          selectedImg = images.first;

          setState(() {});
        }
        cancel();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: detailsMovie != null
            ? MovieDetailsPage(
                backdrop: detailsMovie!.posterPath,
                title: detailsMovie!.title,
                overview: detailsMovie!.overview,
                vote: detailsMovie!.voteAverage,
                genres: detailsMovie!.genres,
                images: images,
                generesMovie: generesMovie,
                onPageChanged: (index) {
                  setState(() {
                    selectedImg = images[index];
                  });
                },
                onDownload: selectedImg != ""
                    ? () async {
                        //TODO download image from link
                      }
                    : null,
              )
            : detailsSerie != null
                ? SerieDetailsPage(
                    backdropPath: detailsSerie!.posterPath,
                    name: detailsSerie!.name,
                    overview: detailsSerie!.overview,
                    vote: detailsSerie!.voteAverage,
                    numberOfEpisodes: detailsSerie!.numberOfEpisodes,
                    inProduction: detailsSerie!.inProduction,
                    firstAirDate: detailsSerie!.firstAirDate,
                    lastAirDate: detailsSerie!.lastAirDate,
                    genres: detailsSerie!.genres,
                    generesSeries: generesSeries,
                    images: images,
                    onPageChanged: (index) {
                      setState(() {
                        selectedImg = images[index];
                      });
                    },
                    onDownload: selectedImg != ""
                        ? () async {
                            //TODO download image from link
                          }
                        : null,
                  )
                : const SizedBox.shrink(),
      ),
    );
  }
}
