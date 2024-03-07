import 'package:martial_art/presentation/daily_reward_screen/daily_reward_screen.dart';

import 'controller/home_screen_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/home_screen_page/home_screen_page.dart';
import 'package:martial_art/presentation/points_tab_container_page/points_tab_container_page.dart';
import 'package:martial_art/presentation/progress_page/progress_page.dart';
import 'package:martial_art/presentation/win_tracker_page/win_tracker_page.dart';
import 'package:martial_art/widgets/custom_bottom_bar.dart';

class HomeScreenContainerScreen
    extends GetWidget<HomeScreenContainerController> {
  const HomeScreenContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.homeScreenPage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeScreenPage;
      case BottomBarEnum.Vector:
        return AppRoutes.winTrackerPage;
      case BottomBarEnum.Settingsprimary:
        return AppRoutes.pointsTabContainerPage;
      case BottomBarEnum.Reward:
        return AppRoutes.dailyRewardPage;
      case BottomBarEnum.Activity:
        return AppRoutes.progressPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeScreenPage:
        return HomeScreenPage();
      case AppRoutes.winTrackerPage:
        return WinTrackerPage();
      case AppRoutes.pointsTabContainerPage:
        return PointsTabContainerPage();
      case AppRoutes.dailyRewardPage:
        return DailyRewardScreen();
      case AppRoutes.progressPage:
        return ProgressPage();
      default:
        return DefaultWidget();
    }
  }
  // PointsTabContainerPage
}
