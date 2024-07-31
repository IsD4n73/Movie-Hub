import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:readmore/readmore.dart';
import '../commons/app_bar.dart';
import '../models/tmdb_genreIds.dart' as genreIds;

import '../commons/app_colors.dart';
import '../commons/vars.dart';
import '../models/movie_details.dart';
import '../models/watch_provider.dart';

class MovieDetailsPage extends StatelessWidget {
  final String backdrop, title, overview;
  final double vote;
  final List<Flatrate> providers;
  final List<Genre> genres;
  final List<String> images;
  final List<genreIds.Genre> generesMovie;
  final void Function(int) onPageChanged;
  final void Function()? onDownload;

  const MovieDetailsPage({
    super.key,
    required this.backdrop,
    required this.title,
    required this.overview,
    required this.vote,
    required this.providers,
    required this.genres,
    required this.images,
    required this.generesMovie,
    required this.onPageChanged,
    required this.onDownload,
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
                "${Vars.imageBaseUrl}$backdrop",
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
                      title,
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
                          vote.toStringAsFixed(2),
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
                    Text(genres
                        .map(
                          (e) => generesMovie
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
                                  Vars.imageBaseUrl + providers[index].logoPath,
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
                    minimumSize: Size(MediaQuery.of(context).size.width, 40),
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
    );
  }
}
