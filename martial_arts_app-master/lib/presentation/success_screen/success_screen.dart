import '../../widgets/app_bar/appbar_subtitle.dart';
import 'controller/success_controller.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/widgets/app_bar/custom_app_bar.dart';
import 'package:martial_art/widgets/custom_elevated_button.dart';
import 'package:lottie/lottie.dart';

// ignore_for_file: must_be_immutable
class SuccessScreen extends GetWidget<SuccessController> {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 46.h),
          child: Column(
            children: [
              Spacer(
                flex: 44,
              ),
              // Lottie.asset(ImageConstant.ani1),
              CustomImageView(
                imagePath: ImageConstant.pic8,
                height: 160.v,
                width: 170.h,
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  right: 1.h,
                  bottom: 1.v,
                ),
              ),
              SizedBox(height: 33.v),
              Text(
                "lbl_done".tr,
                style: TextStyle(
                  color: appTheme.blueGray900,
                  fontSize: 36.fSize,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.v),
              Container(
                width: 292.h,
                margin: EdgeInsets.only(
                  left: 3.h,
                  right: 6.h,
                ),
                child: Text(
                  "msg_your_submission".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appTheme.gray70001,
                    fontSize: 16.fSize,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20.v),
              CustomElevatedButton(
                onPressed: () {
                  Get.back();
                },
                text: "lbl_ok".tr,
                buttonTextStyle: CustomTextStyles.titleLargeInterGray5001,
              ),
              Spacer(
                flex: 55,
              ),
            ],
          ),
        ),
        // bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      // leadingWidth: 49.h,
      height: 60.0,
      leading: Container(
        height: 28.v,
        width: 29.h,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 6.v,
          bottom: 6.v,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgImage14,
              height: 28.v,
              width: 29.h,
              radius: BorderRadius.circular(
                14.h,
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
      title: AppbarSubtitle(
        text: "msg_black_belt_tracker".tr,
        margin: EdgeInsets.only(left: 8.h),
      ),
      actions: [
        Container(
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 8.v,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgIconButton,
                height: 24.adaptSize,
                width: 24.adaptSize,
                alignment: Alignment.center,
                color: appTheme.gray800,
              ),
            ],
          ),
        ),
      ],
      styleType: Style.bgOutline,
    );
  }

  // /// Section Widget
  // Widget _buildBottomBar() {
  //   return CustomBottomBar(
  //     onChanged: (BottomBarEnum type) {
  //       Get.toNamed(getCurrentRoute(type), id: 1);
  //     },
  //   );
  // }

  // ///Handling route based on bottom click actions
  // String getCurrentRoute(BottomBarEnum type) {
  //   switch (type) {
  //     case BottomBarEnum.Home:
  //       return AppRoutes.homeScreenPage;
  //     case BottomBarEnum.Vector:
  //       return AppRoutes.pointsTabContainerPage;
  //     case BottomBarEnum.Settingsprimary:
  //       return AppRoutes.winTrackerPage;
  //     case BottomBarEnum.Reward:
  //       return AppRoutes.dailyRewardPage;
  //     case BottomBarEnum.Activity:
  //       return AppRoutes.progressPage;
  //     default:
  //       return "/";
  //   }
  // }

  // ///Handling page based on route
  // Widget getCurrentPage(String currentRoute) {
  //   switch (currentRoute) {
  //     case AppRoutes.homeScreenPage:
  //       return HomeScreenPage();
  //     case AppRoutes.pointsTabContainerPage:
  //       return PointsTabContainerPage();
  //     case AppRoutes.winTrackerPage:
  //       return WinTrackerPage();
  //     case AppRoutes.dailyRewardPage:
  //       return DailyRewardPage();
  //     case AppRoutes.progressPage:
  //       return ProgressPage();
  //     default:
  //       return DefaultWidget();
  //   }
  // }
}
