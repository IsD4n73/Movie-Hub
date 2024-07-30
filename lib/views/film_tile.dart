import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_hub/commons/app_colors.dart';

import '../commons/vars.dart';

class FilmTile extends StatelessWidget {
  final String title, description, imageUrl, tags;
  final double rating;
  final void Function() onTap;

  factory FilmTile.empty() {
    return FilmTile(
        title: "title",
        description: "description",
        imageUrl: "imageUrl",
        rating: 0,
        onTap: () {},
        tags: "tags");
  }

  const FilmTile({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.onTap,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: onTap,
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              child: Image.network(
                "${Vars.imageBaseUrl}$imageUrl",
                height: 270,
                width: 180,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.greyColor,
                  height: 270,
                  width: 180,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        rating.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(width: 5),
                      RatingBarIndicator(
                        rating: rating / 2,
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
                  const SizedBox(height: 5),
                  Text(tags),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
