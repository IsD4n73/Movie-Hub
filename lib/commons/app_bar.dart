import 'package:flutter/material.dart';
import 'package:movie_hub/commons/app_colors.dart';

AppBar buildAppbar(String title, void Function()? onBack) {
  return AppBar(
    title: RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 30,
        ),
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: '.',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
    ),
    automaticallyImplyLeading: false,
    leading: title != "Home"
        ? IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.chevron_left),
          )
        : null,
  );
}
