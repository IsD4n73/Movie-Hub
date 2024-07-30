import 'package:flutter/material.dart';
import 'package:movie_hub/views/film_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

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
              hintText: "Ricerca",
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
            const Text(
              "Risultati di ricerca (3)",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => FilmTile(
                  title: "title",
                  description: "description",
                  imageUrl: "imageUrl",
                  rating: 2.5,
                  onTap: () {},
                  tags: "tags"),
            )
          ],
        ),
      ),
    );
  }
}
