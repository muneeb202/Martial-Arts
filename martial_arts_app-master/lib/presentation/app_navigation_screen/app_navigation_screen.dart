import 'package:flutter/services.dart';

import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: Column(
        children: [
          _buildAppNavigation(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                ),
                child: Column(
                  children: [
                    _buildScreenTitle(
                      screenTitle: "Splash screen".tr,
                      onTapScreenTitle: () =>
                          onTapScreenTitle(AppRoutes.splashScreen),
                    ),
                    _buildScreenTitle(
                      screenTitle: "Home Screen - Container".tr,
                      onTapScreenTitle: () => onTapScreenTitle(
                          AppRoutes.homeScreenContainerScreen),
                    ),
                    _buildScreenTitle(
                      screenTitle: "Activity answer".tr,
                      onTapScreenTitle: () =>
                          onTapScreenTitle(AppRoutes.activityAnswerScreen),
                    ),
                    _buildScreenTitle(
                      screenTitle: "success".tr,
                      onTapScreenTitle: () =>
                          onTapScreenTitle(AppRoutes.successScreen),
                    ),
                    _buildScreenTitle(
                      screenTitle: "Register - Tab Container".tr,
                      onTapScreenTitle: () => onTapScreenTitle(
                          AppRoutes.registerTabContainerScreen),
                    ),
                    _buildScreenTitle(
                      screenTitle: "Detail Page".tr,
                      onTapScreenTitle: () =>
                          onTapScreenTitle(AppRoutes.detailPageScreen),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
