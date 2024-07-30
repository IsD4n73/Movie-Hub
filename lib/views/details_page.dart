import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_hub/commons/app_colors.dart';
import 'package:movie_hub/models/movie_details.dart';
import 'package:movie_hub/models/movies_images.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:readmore/readmore.dart';

import '../commons/vars.dart';
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
          detailsMovie = MovieDetails.fromJson(json);
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
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          "${Vars.imageBaseUrl}${detailsMovie!.backdropPath}",
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                detailsMovie!.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    detailsMovie!.voteAverage
                                        .toStringAsFixed(2),
                                    style: const TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  RatingBarIndicator(
                                    rating: detailsMovie!.voteAverage / 2,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: AppColors.primaryColor,
                                    ),
                                    itemCount: 5,
                                    itemSize: 25,
                                    direction: Axis.horizontal,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(detailsMovie!.genres
                                  .map(
                                    (e) => generesMovie
                                        .firstWhere(
                                            (element) => element.id == e.id)
                                        .name,
                                  )
                                  .join(", ")),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.chevron_left,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ReadMoreText(
                      detailsMovie!.overview,
                      trimMode: TrimMode.Line,
                      trimLines: 5,
                      trimCollapsedText: ' Mostra altro'.tr(),
                      trimExpandedText: ' Mostra meno'.tr(),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                      moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                      lessStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: PhotoViewGallery.builder(
                        onPageChanged: (index) {
                          setState(() {
                            selectedImg = images[index];
                          });
                        },
                        itemCount: images.length,
                        builder: (context, index) {
                          return PhotoViewGalleryPageOptions(
                            imageProvider: NetworkImage(images[index]),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    FilledButton(
                      onPressed: () async {
                        //TODO download image from link
                      },
                      style: FilledButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 40),
                        backgroundColor: AppColors.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text("Scarica immagine".tr()),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
