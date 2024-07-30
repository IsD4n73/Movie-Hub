import 'package:bot_toast/bot_toast.dart';
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

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load(fileName: ".env");
  Vars.packageInfo = await PackageInfo.fromPlatform();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Hub',
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
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
            title: const Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Ricerca"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.info),
            title: const Text("Info"),
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
          "Informazioni",
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
