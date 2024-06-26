import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:martial_art/presentation/home_screen_page/home_screen_page.dart';
import 'package:martial_art/presentation/streaks_page/streaks_page.dart';
import 'package:martial_art/presentation/win_tracker_page/win_tracker_page.dart';
import 'core/app_export.dart';
import 'package:get/get.dart';
import './services/ApiService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
  //     statusBarColor: Colors.white, // Color for Android
  //     statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
  // ));

  Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

  bool isUserLoggedIn =
      await ApiService.isUserLoggedIn(); // await the result here

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);

  runApp(MyApp(
      isUserLoggedIn: isUserLoggedIn)); // pass the result to MyApp constructor
}

class MyApp extends StatelessWidget {
  final bool isUserLoggedIn;

  MyApp({required this.isUserLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        translations: AppLocalization(),
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en', 'US'),
        title: 'Black Belt Tracker',
        initialBinding: InitialBindings(),
        // home: HomeScreenPage(),
        initialRoute: isUserLoggedIn
            ? AppRoutes.homeScreenContainerScreen
            : AppRoutes.initialRoute,
        getPages: AppRoutes.pages,
      );
    });
  }
}
