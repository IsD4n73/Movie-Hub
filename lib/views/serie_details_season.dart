import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movie_hub/commons/vars.dart';
import 'package:movie_hub/controllers/season_controller.dart';
import 'package:readmore/readmore.dart';
import '../commons/app_colors.dart';
import '../models/serie_details.dart';
import '../models/serie_episodes.dart';

class SerieDetailsSeasonPage extends StatefulWidget {
  final List<Season> seasons;
  final int tvId;
  const SerieDetailsSeasonPage({
    super.key,
    required this.seasons,
    required this.tvId,
  });

  @override
  State<SerieDetailsSeasonPage> createState() => _SerieDetailsSeasonPageState();
}

class _SerieDetailsSeasonPageState extends State<SerieDetailsSeasonPage> {
  List<Episode>? seasonEpisodes;
  Season? dropdownValue;

  @override
  void initState() {
    var cancel = BotToast.showLoading();

    Future.delayed(
      Duration.zero,
      () async {
        dropdownValue = widget.seasons.first;

        seasonEpisodes = await SeasonController.getSeasons(widget.tvId,
            dropdownValue!.seasonNumber, context.locale.languageCode);
        setState(() {});
        cancel();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        DropdownButton<Season>(
          value: dropdownValue,
          isExpanded: true,
          padding: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(5),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: widget.seasons.map((Season item) {
            return DropdownMenuItem(
              value: item,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.name),
                  Text(
                    "(${item.episodeCount} episodi)",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (Season? newValue) async {
            var cancel = BotToast.showLoading();
            setState(() {
              dropdownValue = newValue!;
            });
            seasonEpisodes = await SeasonController.getSeasons(widget.tvId,
                dropdownValue!.seasonNumber, context.locale.languageCode);
            setState(() {});
            cancel();
          },
        ),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 200,
          ),
          itemCount: seasonEpisodes?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  showBarModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.black,
                    isDismissible: true,
                    enableDrag: true,
                    builder: (context) => SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.network(
                            Vars.imageBaseUrl +
                                seasonEpisodes![index].stillPath,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              color: AppColors.greyColor,
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            seasonEpisodes![index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          seasonEpisodes![index].airDate != null
                              ? Text(
                                  DateFormat('dd/MM/yyyy')
                                      .format(seasonEpisodes![index].airDate!),
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(height: 10),
                          ReadMoreText(
                            seasonEpisodes![index].overview,
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
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                seasonEpisodes![index]
                                    .voteAverage
                                    .toStringAsFixed(2),
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                              const SizedBox(width: 5),
                              RatingBarIndicator(
                                rating: seasonEpisodes![index].voteAverage / 2,
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
                          seasonEpisodes![index].guestStars.isEmpty
                              ? const SizedBox.shrink()
                              : SizedBox(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    itemCount: seasonEpisodes![index]
                                        .guestStars
                                        .length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i) {
                                      return Card(
                                        margin: const EdgeInsets.all(4),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  Vars.imageBaseUrl +
                                                      seasonEpisodes![index]
                                                          .guestStars[i]
                                                          .profilePath,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    seasonEpisodes![index]
                                                        .guestStars[i]
                                                        .name,
                                                  ),
                                                  Text(
                                                    seasonEpisodes![index]
                                                        .guestStars[i]
                                                        .character,
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
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                },
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      child: Image.network(
                        Vars.imageBaseUrl + seasonEpisodes![index].stillPath,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: AppColors.greyColor,
                          height: 120,
                          width: 200,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${seasonEpisodes![index].episodeNumber} - ${seasonEpisodes![index].name}",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Minuti".tr(
                        args: [
                          seasonEpisodes![index].runtime.toString(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
