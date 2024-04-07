import 'controller/detail_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/widgets/custom_elevated_button.dart';
import 'package:readmore/readmore.dart';

// ignore_for_file: must_be_immutable
class DetailPageScreen extends GetWidget<DetailPageController> {
  const DetailPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray100,
      body: SizedBox(
        height: 781.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 172.v),
                decoration: AppDecoration.gradientPrimaryToDeeporange200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 56.v),
                    Padding(
                      padding: EdgeInsets.only(left: 74.h),
                      child: Text(
                        "lbl_free_trip2".tr,
                        style: TextStyle(
                          color: appTheme.whiteA700,
                          fontSize: 28.fSize,
                          fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Spacer(),
                    _buildStackOne(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Opacity(
                opacity: 0.55,
                child: Text(
                  "lbl_jakarta_200im".tr,
                  style: TextStyle(
                    color: appTheme.whiteA700.withOpacity(0.55),
                    fontSize: 128.fSize,
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Opacity(
                opacity: 0.25,
                child: Padding(
                  padding: EdgeInsets.only(top: 69.v),
                  child: Text(
                    "lbl_jakarta_200im".tr,
                    style: TextStyle(
                      color: appTheme.whiteA700.withOpacity(0.44),
                      fontSize: 128.fSize,
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            _buildColumnOne(),
            _buildColumnTwo(),
            CustomImageView(
              imagePath: ImageConstant.imgArrowDownRed100,
              height: 24.adaptSize,
              width: 24.adaptSize,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                left: 30.h,
                top: 63.v,
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: _buildBottomBar(),
    );
  }

  /// Section Widget
  Widget _buildStackOne() {
    return SizedBox(
      height: 385.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img1669Logo,
            height: 385.v,
            width: 393.h,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 1.h,
                right: 146.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 126.v,
                    width: 62.h,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 50.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 20.v,
                      width: 80.h,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnOne() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageConstant.imgGroup42,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomImageView(
          imagePath: ImageConstant.imgGroup42,
          height: 341.v,
          width: 393.h,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnTwo() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 33.v,
        ),
        decoration: AppDecoration.fillWhiteA700.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 17.v),
            Text(
              "Monthly Giveaway".tr,
              style: TextStyle(
                color: appTheme.gray700,
                fontSize: 24.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 5.v),
            Text(
              "msg_ends_on_dec_2023".tr,
              style: TextStyle(
                color: appTheme.gray700,
                fontSize: 13.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 32.v),
            SizedBox(
              width: 335.h,
              child: ReadMoreText(
                "msg_join_us_for_the".tr,
                trimLines: 5,
                colorClickableText: theme.colorScheme.primary,
                trimMode: TrimMode.Line,
                trimCollapsedText: "lbl_read_more".tr,
                moreStyle: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 12.fSize,
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w400,
                ),
                lessStyle: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 12.fSize,
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 13.v),
            CustomElevatedButton(
              height: 38.v,
              width: 140.h,
              text: "lbl_claim_now".tr,
              buttonStyle: CustomButtonStyles.outlinePrimaryTL19,
              buttonTextStyle: TextStyle(color: appTheme.whiteA700),
            ),
          ],
        ),
      ),
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
