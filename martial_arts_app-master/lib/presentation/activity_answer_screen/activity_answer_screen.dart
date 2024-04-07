import 'controller/activity_answer_controller.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/widgets/app_bar/appbar_leading_circleimage.dart';
import 'package:martial_art/widgets/app_bar/appbar_title.dart';
import 'package:martial_art/widgets/app_bar/appbar_trailing_image.dart';
import 'package:martial_art/widgets/app_bar/custom_app_bar.dart';
import 'package:martial_art/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ActivityAnswerScreen extends GetWidget<ActivityAnswerController> {
  const ActivityAnswerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 19.h),
        child: Column(
          children: [
            SizedBox(height: 16.v),
            _buildWinTrackerRow(),
            SizedBox(height: 28.v),
            _buildHeaderBg(),
            SizedBox(height: 32.v),
            _buildFrame(),
            SizedBox(height: 32.v),
            _buildSubmitStack(),
            SizedBox(height: 9.v),
            _buildWhatDidYouEnjoyRow(),
            SizedBox(height: 9.v),
            _buildWhatDidYouDoRow(),
            SizedBox(height: 9.v),
            _buildWhatMadeYouSmileRow(),
            SizedBox(height: 9.v),
            _buildWhatDidYouFindRow(),
          ],
        ),
      ),
      // bottomNavigationBar: _buildBottomBar(),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 48.h,
      leading: AppbarLeadingCircleimage(
        imagePath: ImageConstant.imgImage14,
        margin: EdgeInsets.only(
          left: 19.h,
          top: 5.v,
          bottom: 6.v,
        ),
      ),
      title: AppbarTitle(
        text: "msg_martial_art_habit".tr,
        margin: EdgeInsets.only(left: 5.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconButton,
          margin: EdgeInsets.symmetric(
            horizontal: 22.h,
            vertical: 8.v,
          ),
        ),
      ],
      styleType: Style.bgOutline,
    );
  }

  /// Section Widget
  Widget _buildWinTrackerRow() {
    return Padding(
      padding: EdgeInsets.only(left: 7.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 48.v,
            width: 131.h,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "lbl_win_tracker".tr,
                    style: TextStyle(
                      color: appTheme.blueGray900,
                      fontSize: 23.fSize,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "msg_sun_1_january_2024".tr,
                    style: TextStyle(
                      color: appTheme.gray700,
                      fontSize: 12.fSize,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgContrast,
            height: 42.adaptSize,
            width: 42.adaptSize,
            margin: EdgeInsets.only(
              top: 3.v,
              bottom: 2.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHeaderBg() {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.circleBorder16,
      ),
      child: Container(
        height: 148.v,
        width: 350.h,
        decoration: AppDecoration.outlineBlack900.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder16,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Opacity(
              opacity: 0.5,
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse1148x311,
                height: 148.v,
                width: 311.h,
                alignment: Alignment.centerLeft,
              ),
            ),
            Opacity(
              opacity: 0.5,
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse2148x231,
                height: 148.v,
                width: 231.h,
                alignment: Alignment.centerLeft,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 139.h,
                          child: Text(
                            "msg_my_plans_for_today".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: appTheme.whiteA700,
                              fontSize: 24.fSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 7.v),
                        Text(
                          "lbl_3_9_complete".tr,
                          style: TextStyle(
                            color: appTheme.whiteA700,
                            fontSize: 12.fSize,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100.v,
                    width: 102.h,
                    margin: EdgeInsets.only(left: 37.h),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 100.v,
                            width: 102.h,
                            child: CircularProgressIndicator(
                              value: 0.5,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 21.h),
                            child: Text(
                              "lbl_30".tr,
                              style: TextStyle(
                                color: appTheme.whiteA700,
                                fontSize: 21.fSize,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame() {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.h,
        right: 10.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "msg_ongoing_activities".tr,
            style: TextStyle(
              color: appTheme.blueGray900,
              fontSize: 21.fSize,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 5.v,
              bottom: 7.v,
            ),
            child: Text(
              "lbl_view_all".tr,
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 11.fSize,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSubmitStack() {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: appTheme.whiteA700,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.circleBorder10,
      ),
      child: Container(
        height: 169.v,
        width: 334.h,
        padding: EdgeInsets.symmetric(
          horizontal: 4.h,
          vertical: 8.v,
        ),
        decoration: AppDecoration.outlineGrayC.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder10,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 37.v,
                width: 40.h,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 13.h,
                  right: 9.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 35.v,
                            width: 37.h,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgClosePrimary,
                                  height: 35.v,
                                  width: 37.h,
                                  alignment: Alignment.center,
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgUserWhiteA700,
                                  height: 20.v,
                                  width: 16.h,
                                  alignment: Alignment.center,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 13.h,
                              top: 10.v,
                              bottom: 3.v,
                            ),
                            child: Text(
                              "msg_what_did_you_learn".tr,
                              style: TextStyle(
                                color: appTheme.gray700,
                                fontSize: 15.fSize,
                                fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgUiCheckbox,
                            height: 30.adaptSize,
                            width: 30.adaptSize,
                            margin: EdgeInsets.only(
                              left: 35.h,
                              top: 3.v,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 11.v),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      margin: EdgeInsets.only(right: 2.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusStyle.circleBorder10,
                      ),
                      child: Container(
                        height: 60.v,
                        width: 250.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusStyle.circleBorder10,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Opacity(
                                opacity: 0.8,
                                child: Text(
                                  "lbl_name".tr,
                                  style: TextStyle(
                                    color: appTheme.redA700A2,
                                    fontSize: 12.fSize,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.h,
                                  vertical: 13.v,
                                ),
                                decoration:
                                    AppDecoration.outlinePrimary1.copyWith(
                                  borderRadius: BorderRadiusStyle.circleBorder2,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 16.v),
                                    Opacity(
                                      opacity: 0.8,
                                      child: Text(
                                        "msg_input_your_answer".tr,
                                        style: TextStyle(
                                          color: appTheme.blueGray900A2,
                                          fontSize: 12.fSize,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 7.v),
                    CustomElevatedButton(
                      height: 34.v,
                      text: "lbl_submit".tr,
                      margin: EdgeInsets.only(left: 50.h),
                      buttonStyle: CustomButtonStyles.none,
                      decoration:
                          CustomButtonStyles.gradientOrangeAToPrimaryDecoration,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWhatDidYouEnjoyRow() {
    return Container(
      margin: EdgeInsets.only(
        left: 9.h,
        right: 12.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.outlineGrayC.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 35.v,
            width: 37.h,
            margin: EdgeInsets.only(
              left: 3.h,
              bottom: 1.v,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgUserGray800,
                  height: 35.v,
                  width: 37.h,
                  alignment: Alignment.center,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgFavorite,
                  height: 19.v,
                  width: 20.h,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 7.v),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              top: 8.v,
              bottom: 6.v,
            ),
            child: Text(
              "msg_what_did_you_enjoy".tr,
              style: TextStyle(
                color: appTheme.gray700,
                fontSize: 15.fSize,
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(
              top: 3.v,
              bottom: 1.v,
            ),
            padding: EdgeInsets.all(5.h),
            decoration: AppDecoration.outlineOrangeA.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder2,
            ),
            child: Container(
              height: 18.adaptSize,
              width: 18.adaptSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  2.h,
                ),
                gradient: LinearGradient(
                  begin: Alignment(1, 1),
                  end: Alignment(1, 0),
                  colors: [
                    theme.colorScheme.primary,
                    appTheme.yellow900,
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
  Widget _buildWhatDidYouDoRow() {
    return Container(
      margin: EdgeInsets.only(
        left: 9.h,
        right: 12.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.outlineGrayC.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 35.v,
            width: 37.h,
            margin: EdgeInsets.only(
              left: 2.h,
              top: 1.v,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgUserRedA200,
                  height: 35.v,
                  width: 37.h,
                  alignment: Alignment.center,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgSmile,
                  height: 28.adaptSize,
                  width: 28.adaptSize,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              top: 8.v,
              bottom: 6.v,
            ),
            child: Text(
              "msg_what_did_you_do".tr,
              style: TextStyle(
                color: appTheme.gray700,
                fontSize: 15.fSize,
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgUiCheckbox,
            height: 30.adaptSize,
            width: 30.adaptSize,
            margin: EdgeInsets.only(
              left: 22.h,
              top: 1.v,
              bottom: 3.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWhatMadeYouSmileRow() {
    return Container(
      margin: EdgeInsets.only(
        left: 8.h,
        right: 13.h,
      ),
      padding: EdgeInsets.symmetric(vertical: 7.v),
      decoration: AppDecoration.outlineGrayC.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 35.v,
            width: 37.h,
            margin: EdgeInsets.only(bottom: 1.v),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgUserRedA700,
                  height: 35.v,
                  width: 37.h,
                  alignment: Alignment.center,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgCalendar,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.v,
              bottom: 4.v,
            ),
            child: Text(
              "msg_what_made_you_smile".tr,
              style: TextStyle(
                color: appTheme.gray700,
                fontSize: 15.fSize,
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 3.v,
              bottom: 1.v,
            ),
            padding: EdgeInsets.all(5.h),
            decoration: AppDecoration.outlineOrangeA.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder2,
            ),
            child: Container(
              height: 18.adaptSize,
              width: 18.adaptSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  2.h,
                ),
                gradient: LinearGradient(
                  begin: Alignment(1, 1),
                  end: Alignment(1, 0),
                  colors: [
                    theme.colorScheme.primary,
                    appTheme.yellow900,
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
  Widget _buildWhatDidYouFindRow() {
    return Container(
      margin: EdgeInsets.only(
        left: 8.h,
        right: 13.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.outlineGray5004c.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgCloseRed700,
            height: 35.v,
            width: 37.h,
            margin: EdgeInsets.only(
              left: 5.h,
              bottom: 1.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              top: 7.v,
              bottom: 7.v,
            ),
            child: Text(
              "msg_what_did_you_find".tr,
              style: TextStyle(
                color: appTheme.gray700,
                fontSize: 15.fSize,
                fontFamily: 'Noto Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgUiCheckbox,
            height: 30.adaptSize,
            width: 30.adaptSize,
            margin: EdgeInsets.only(
              left: 8.h,
              bottom: 4.v,
            ),
          ),
        ],
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
