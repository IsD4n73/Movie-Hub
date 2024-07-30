import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/commons/vars.dart';

import '../commons/app_colors.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Versione: ".tr(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: Vars.packageInfo.version,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Numero build: ".tr(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: Vars.packageInfo.buildNumber,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Powered by: ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: "themoviedb.org",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Image.asset(
              "assets/tmdb.png",
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            CustomDropdown<Locale>(
              hintText: 'Lingua App'.tr(),
              items: context.supportedLocales,
              initialItem: context.locale,
              decoration: CustomDropdownDecoration(
                closedFillColor: Theme.of(context).scaffoldBackgroundColor,
                expandedFillColor: Theme.of(context).scaffoldBackgroundColor,
                closedBorder: Border.all(color: AppColors.primaryColor),
                expandedBorder: Border.all(color: AppColors.primaryColor),
                listItemDecoration: const ListItemDecoration(
                  selectedColor: AppColors.primaryColor,
                  splashColor: AppColors.primaryColor,
                ),
                prefixIcon: const Icon(Icons.language),
              ),
              onChanged: (value) {
                context.setLocale(value!);
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
