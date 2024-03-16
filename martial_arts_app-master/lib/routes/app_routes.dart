import 'package:martial_art/presentation/daily_reward_screen/binding/daily_reward_binding.dart';
import 'package:martial_art/presentation/daily_reward_screen/daily_reward_screen.dart';
import 'package:martial_art/presentation/splash_screen/splash_screen.dart';
import 'package:martial_art/presentation/splash_screen/binding/splash_binding.dart';
import 'package:martial_art/presentation/home_screen_container_screen/home_screen_container_screen.dart';
import 'package:martial_art/presentation/home_screen_container_screen/binding/home_screen_container_binding.dart';
import 'package:martial_art/presentation/activity_answer_screen/activity_answer_screen.dart';
import 'package:martial_art/presentation/activity_answer_screen/binding/activity_answer_binding.dart';
import 'package:martial_art/presentation/success_screen/success_screen.dart';
import 'package:martial_art/presentation/success_screen/binding/success_binding.dart';
import 'package:martial_art/presentation/register_tab_container_screen/register_tab_container_screen.dart';
import 'package:martial_art/presentation/register_tab_container_screen/binding/register_tab_container_binding.dart';
import 'package:martial_art/presentation/detail_page_screen/detail_page_screen.dart';
import 'package:martial_art/presentation/detail_page_screen/binding/detail_page_binding.dart';
import 'package:martial_art/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:martial_art/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

import '../presentation/badges_detail_screen/badges_detail_screen.dart';
import '../presentation/badges_detail_screen/binding/badges_detail_binding.dart';
import '../presentation/my_badges_screen/binding/my_badges_binding.dart';
import '../presentation/my_badges_screen/my_badges_screen.dart';
import '../presentation/reward_info_screen/binding/reward_info_binding.dart';
import '../presentation/reward_info_screen/reward_info_screen.dart';
import '../presentation/login_page/login_page.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginPage = '/login_page';

  static const String homeScreenPage = '/home_screen_page';

  static const String homeScreenContainerScreen =
      '/home_screen_container_screen';

  static const String winTrackerPage = '/win_tracker_page';

  static const String activityAnswerScreen = '/activity_answer_screen';

  static const String successScreen = '/success_screen';

  static const String registerPage = '/register_page';

  static const String registerTabContainerScreen =
      '/register_tab_container_screen';

  static const String pointsOnePage = '/points_one_page';

  static const String streaksPage = '/streaks_page';

  static const String pointsPage = '/points_page';

  static const String pointsTabContainerPage = '/points_tab_container_page';

  static const String streaksOnePage = '/streaks_one_page';

  static const String progressPage = '/progress_page';

  static const String dailyRewardPage = '/daily_reward_page';

  static const String detailPageScreen = '/detail_page_screen';

  static const String myBadgesScreen = '/my_badges_screen';

  static const String badgesDetailScreen = '/bedges_detail_screen';

  static const String rewardInfoScreen = '/reward_info_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: dailyRewardPage,
      page: () => DailyRewardScreen(),
      bindings: [
        DailyRewardBinding(),
      ],
    ),
    GetPage(
      name: rewardInfoScreen,
      page: () => RewardInfoScreen(
        img: '',
        streaks: -1,
      ),
      bindings: [
        RewardInfoBinding(),
      ],
    ),
    GetPage(
      name: homeScreenContainerScreen,
      page: () => HomeScreenContainerScreen(),
      bindings: [
        HomeScreenContainerBinding(),
      ],
    ),
    GetPage(
      name: activityAnswerScreen,
      page: () => ActivityAnswerScreen(),
      bindings: [
        ActivityAnswerBinding(),
      ],
    ),
    GetPage(
      name: successScreen,
      page: () => SuccessScreen(),
      bindings: [
        SuccessBinding(),
      ],
    ),
    GetPage(
      name: myBadgesScreen,
      page: () => MyBadgesScreen(),
      bindings: [
        MyBadgesBinding(),
      ],
    ),
    GetPage(
      name: registerTabContainerScreen,
      page: () => RegisterTabContainerScreen(),
      bindings: [
        RegisterTabContainerBinding(),
      ],
    ),
    GetPage(
      name: badgesDetailScreen,
      page: () => BadgesDetailScreen(),
      bindings: [
        BadgesDetailBinding(),
      ],
    ),
    GetPage(
      name: detailPageScreen,
      page: () => DetailPageScreen(),
      bindings: [
        DetailPageBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
  ];
}
