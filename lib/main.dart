import 'package:bot_toast/bot_toast.dart';
import 'package:catcher_2/catcher_2.dart';
import 'package:catcher_2/core/catcher_2.dart';
import 'package:catcher_2/handlers/console_handler.dart';
import 'package:catcher_2/mode/dialog_report_mode.dart';
import 'package:catcher_2/model/catcher_2_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movie_hub/commons/app_bar.dart';
import 'package:movie_hub/commons/app_colors.dart';
import 'package:movie_hub/commons/vars.dart';
import 'package:movie_hub/views/home_page.dart';
import 'package:movie_hub/views/info_page.dart';
import 'package:movie_hub/views/search_page.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized().then(
    (_) {
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    },
  );

  await dotenv.load(fileName: ".env");
  Vars.packageInfo = await PackageInfo.fromPlatform();

  Catcher2Options debugOptions = Catcher2Options(
    DialogReportMode(),
    [
      ConsoleHandler(),
      DiscordHandler(
        Vars.discordUrl,
        enableApplicationParameters: true,
        enableDeviceParameters: true,
        printLogs: true,
        enableStackTrace: true,
        enableCustomParameters: true,
      ),
    ],
    localizationOptions: [
      LocalizationOptions.buildDefaultItalianOptions(),
      LocalizationOptions.buildDefaultEnglishOptions(),
    ],
    filterFunction: (report) {
      var filter = !report.stackTrace.toString().contains("NetworkImage");
      if (filter) {
        BotToast.closeAllLoading();
      }
      return filter;
    },
  );

  Catcher2Options releaseOptions = Catcher2Options(
    DialogReportMode(),
    [
      DiscordHandler(
        Vars.discordUrl,
        enableApplicationParameters: true,
        enableDeviceParameters: true,
        printLogs: true,
        enableStackTrace: true,
        enableCustomParameters: true,
      ),
    ],
    localizationOptions: [
      LocalizationOptions.buildDefaultItalianOptions(),
      LocalizationOptions.buildDefaultEnglishOptions(),
    ],
    filterFunction: (report) {
      var filter = !report.stackTrace.toString().contains("NetworkImage");
      if (filter) {
        BotToast.closeAllLoading();
      }
      return filter;
    },
  );

  Catcher2(
    rootWidget: EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('it'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return MaterialApp(
      title: 'Movie Hub',
      builder: (context, child) {
        Catcher2.addDefaultErrorWidget();
        child = botToastBuilder(context, child);
        return child;
      },
      navigatorKey: Catcher2.navigatorKey,
      navigatorObservers: [BotToastNavigatorObserver()],
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const AppScaffold(),
    );
  }
}

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  var _currentIndex = 0;

  @override
  void initState() {
    Vars.apiKey = dotenv.env['APIKEY'] ?? "";

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Vars.tmdbClient = TMDB(
        ApiKeys(Vars.apiKey, 'NULL'),
        defaultLanguage: context.locale.languageCode,
        logConfig: const ConfigLogger.recommended(),
      ).v3;
    });

    FlutterNativeSplash.remove();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: switchAppBar(_currentIndex),
      body: switchBody(_currentIndex),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primaryColor,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home").tr(),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Ricerca").tr(),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.info),
            title: const Text("Info").tr(),
          ),
        ],
      ),
    );
  }

  switchAppBar(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return buildAppbar("Home", null);
      case 1:
        return buildAppbar(
          "Ricerca",
          () {
            setState(() {
              _currentIndex = 0;
            });
          },
        );
      case 2:
        return buildAppbar(
          "Info",
          () {
            setState(() {
              _currentIndex = 0;
            });
          },
        );
      default:
        return buildAppbar(
          "OOPS",
          () {
            setState(() {
              _currentIndex = 0;
            });
          },
        );
    }
  }

  switchBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const SearchPage();
      case 2:
        return const InfoPage();
      default:
        return const Placeholder();
    }
  }
}
