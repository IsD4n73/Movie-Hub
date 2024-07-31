import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:movie_hub/controllers/details_controller.dart';
import 'package:movie_hub/models/details_credit.dart';
import 'package:movie_hub/models/movie_details.dart';
import 'package:movie_hub/models/serie_details.dart';
import 'package:movie_hub/models/watch_provider.dart';
import 'package:movie_hub/views/movie_details.dart';
import 'package:movie_hub/views/serie_details.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/tmdb_genreIds.dart' as genreIds;

class DetailsPage extends StatefulWidget {
  final int mediaId;
  final String mediaType;

  const DetailsPage(this.mediaId, this.mediaType, {super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> imagesLinks = [];
  MovieDetails? detailsMovie;
  SerieDetails? detailsSerie;

  late List<genreIds.Genre> generesMovie;
  late List<genreIds.Genre> generesSeries;
  late List<Cast> cast;
  late WatchProvider watchProvider;
  String selectedImg = "";

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async {
        var cancel = BotToast.showLoading();

        // get the genere for movies
        generesMovie =
            await DetailsController.getGenresMovie(context.locale.languageCode);

        // get the genere for series
        generesSeries =
            await DetailsController.getGenresSerie(context.locale.languageCode);

        if (widget.mediaType == "movie") {
          watchProvider = await DetailsController.getMovieWatch(widget.mediaId);
          cast = await DetailsController.getMovieCast(widget.mediaId);
          detailsMovie =
              await DetailsController.getMovieDetails(widget.mediaId);
          imagesLinks.addAll(
            await DetailsController.getMovieImage(
                widget.mediaId, "${context.supportedLocales.join(",")},null"),
          );
          selectedImg = imagesLinks.first;

          setState(() {});
        } else {
          watchProvider = await DetailsController.getSerieWatch(widget.mediaId);
          cast = await DetailsController.getSerieCast(widget.mediaId);
          detailsSerie =
              await DetailsController.getSerieDetails(widget.mediaId);

          imagesLinks.addAll(
            await DetailsController.getSerieImage(
                widget.mediaId, "${context.supportedLocales.join(",")},null"),
          );

          selectedImg = imagesLinks.first;

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
                cast: cast,
                backdrop: detailsMovie!.posterPath,
                title: detailsMovie!.title,
                overview: detailsMovie!.overview,
                vote: detailsMovie!.voteAverage,
                genres: detailsMovie!.genres,
                images: imagesLinks,
                generesMovie: generesMovie,
                providers: context.locale.languageCode == "it"
                    ? watchProvider.results?.it?.flatrate ?? []
                    : watchProvider.results?.us?.flatrate ?? [],
                onPageChanged: (index) {
                  setState(() {
                    selectedImg = imagesLinks[index];
                  });
                },
                onDownload: selectedImg != ""
                    ? () async {
                        await [
                          Permission.storage,
                          Permission.manageExternalStorage,
                        ].request();

                        var response = await Dio().get(
                          selectedImg,
                          options: Options(responseType: ResponseType.bytes),
                        );
                        await ImageGallerySaver.saveImage(
                          Uint8List.fromList(response.data),
                          name: DateTime.timestamp().toString(),
                        );
                        BotToast.showText(text: "Immagine salvata".tr());
                      }
                    : null,
              )
            : detailsSerie != null
                ? SerieDetailsPage(
                    cast: cast,
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
                    images: imagesLinks,
                    providers: context.locale.languageCode == "it"
                        ? watchProvider.results?.it?.flatrate ?? []
                        : watchProvider.results?.us?.flatrate ?? [],
                    onPageChanged: (index) {
                      setState(() {
                        selectedImg = imagesLinks[index];
                      });
                    },
                    onDownload: selectedImg != ""
                        ? () async {
                            await [
                              Permission.storage,
                              Permission.manageExternalStorage,
                            ].request();

                            var response = await Dio().get(
                              selectedImg,
                              options:
                                  Options(responseType: ResponseType.bytes),
                            );
                            await ImageGallerySaver.saveImage(
                              Uint8List.fromList(response.data),
                              name: DateTime.timestamp().toString(),
                            );
                            BotToast.showText(text: "Immagine salvata".tr());
                          }
                        : null,
                  )
                : const SizedBox.shrink(),
      ),
    );
  }
}
