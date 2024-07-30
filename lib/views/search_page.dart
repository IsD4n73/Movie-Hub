import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/commons/vars.dart';
import 'package:movie_hub/models/multi_search.dart';
import 'package:movie_hub/views/film_tile_grid.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  MultiSearch? search;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            SearchBar(
              controller: searchController,
              trailing: [
                IconButton(
                  onPressed: () {
                    searchController.text = "";
                    search = null;
                    setState(() {});
                  },
                  icon: const Icon(Icons.clear),
                ),
              ],
              onChanged: (value) async {
                setState(() {
                  search = null;
                });
                var searchJson = await Vars.tmdbClient.search
                        .queryMulti(value, language: context.locale.countryCode)
                    as Map<String, dynamic>;
                setState(() {
                  search = MultiSearch.fromJson(searchJson);
                });
              },
              hintText: "Ricerca".tr(),
              leading: const Icon(Icons.search),
              shape: const WidgetStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Risultati di ricerca"
                  .tr(args: [(search?.results.length ?? 0).toString()]),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            search != null
                ? GridView.builder(
                    shrinkWrap: true,
                    itemCount: search!.results.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisExtent: 400,
                    ),
                    itemBuilder: (context, index) {
                      return FilmTileGrid(
                        title: search!.results[index].mediaType == "movie"
                            ? search!.results[index].title
                            : search!.results[index].name,
                        imageUrl: search!.results[index].posterPath,
                        rating: search!.results[index].voteAverage,
                        onTap: () {},
                      );
                    },
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
