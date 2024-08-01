import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_hub/views/serie_details_season.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:readmore/readmore.dart';
import '../commons/app_bar.dart';
import '../models/details_credit.dart';
import '../models/serie_details.dart';
import '../models/tmdb_genreIds.dart' as genreIds;

import '../commons/app_colors.dart';
import '../commons/vars.dart';
import '../models/watch_provider.dart';

class SerieDetailsPage extends StatelessWidget {
  final String backdropPath, name, overview;
  final double vote;
  final int numberOfEpisodes, selectedTab, tvId;
  final bool inProduction;
  final Network? producer;
  final DateTime? firstAirDate, lastAirDate;
  final List<Season> seasons;
  final List<Flatrate> providers;
  final List<Genre> genres;
  final List<genreIds.Genre> generesSeries;
  final List<String> images;
  final List<Cast> cast;
  final void Function(int) onPageChanged;
  final void Function(int) onTabChanged;
  final void Function()? onDownload;

  const SerieDetailsPage({
    super.key,
    required this.backdropPath,
    required this.name,
    required this.overview,
    required this.vote,
    required this.numberOfEpisodes,
    required this.inProduction,
    required this.firstAirDate,
    required this.lastAirDate,
    required this.genres,
    required this.generesSeries,
    required this.images,
    required this.onPageChanged,
    required this.onDownload,
    required this.providers,
    required this.cast,
    required this.seasons,
    required this.selectedTab,
    required this.onTabChanged,
    required this.tvId,
    required this.producer,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                "${Vars.imageBaseUrl}$backdropPath",
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
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
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    producer == null
                        ? const SizedBox.shrink()
                        : Image.network(
                            Vars.imageBaseUrl + producer!.logoPath,
                            width: 30,
                            height: 30,
                            color: Colors.white,
                          ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          vote.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(width: 10),
                        RatingBarIndicator(
                          rating: vote / 2,
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
                    Text(
                      "${(firstAirDate?.year ?? "N/A")} - ${inProduction ? "In corso".tr() : (lastAirDate?.year ?? "N/A")} ($numberOfEpisodes ${"episodi".tr()})",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(genres
                        .map(
                          (e) => generesSeries
                              .firstWhere((element) => element.id == e.id)
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
          AnimatedToggleSwitch<int>.size(
            current: selectedTab,
            values: const [0, 1],
            height: 50,
            indicatorSize: Size.fromWidth(MediaQuery.of(context).size.width),
            iconBuilder: (value) {
              return Text(
                value == 0 ? "Info" : "Stagioni",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ).tr();
            },
            iconAnimationType: AnimationType.onSelected,
            style: ToggleStyle(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              indicatorColor: AppColors.primaryColor,
            ),
            onChanged: onTabChanged,
          ),
          selectedTab == 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    ReadMoreText(
                      overview,
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
                    buildAppbar("Cast", null).title!,
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: cast.isEmpty
                          ? Text("Non disponibile".tr())
                          : ListView.builder(
                              itemCount: cast.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: const EdgeInsets.all(4),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            Vars.imageBaseUrl +
                                                cast[index].profilePath,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              cast[index].name,
                                            ),
                                            Text(
                                              cast[index].character,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    const Divider(),
                    buildAppbar("Dove Guardare", null).title!,
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: providers.isEmpty
                          ? Text("Non disponibile".tr())
                          : ListView.builder(
                              itemCount: providers.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: const EdgeInsets.all(4),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            Vars.imageBaseUrl +
                                                providers[index].logoPath,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          providers[index].providerName,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    const Divider(),
                    buildAppbar("Galleria", null).title!,
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: PhotoViewGallery.builder(
                        onPageChanged: onPageChanged,
                        itemCount: images.length,
                        builder: (context, index) {
                          return PhotoViewGalleryPageOptions(
                            imageProvider: NetworkImage(images[index]),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    kIsWeb
                        ? const SizedBox.shrink()
                        : FilledButton(
                            onPressed: onDownload,
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
                  ],
                )
              : SerieDetailsSeasonPage(
                  seasons: seasons.reversed.toList(),
                  tvId: tvId,
                ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
