import 'package:flutter/material.dart';

import '../commons/app_colors.dart';
import '../commons/vars.dart';

class FilmTileGrid extends StatelessWidget {
  final String title, imageUrl;
  final double rating;
  final void Function() onTap;

  const FilmTileGrid({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.onTap,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Row(
              children: [
                Text(
                  rating.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.star,
                  color: AppColors.primaryColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
