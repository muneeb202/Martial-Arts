import 'controller/reward_info_controller.dart';
import '/core/app_export.dart';
import '/widgets/app_bar/appbar_leading_image.dart';
import '/widgets/app_bar/appbar_title.dart';
import '/widgets/app_bar/custom_app_bar.dart';
import '/widgets/custom_elevated_button.dart';
import '/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class RewardInfoScreen extends GetWidget<RewardInfoController> {
  final String img;
  final int streaks;
  const RewardInfoScreen({Key? key, required this.img, required this.streaks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: _buildAppBar(),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 11.v),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 34.h),
              child: CustomIconButton(
                height: 60.adaptSize,
                width: 60.adaptSize,
                padding: EdgeInsets.all(18.h),
                decoration: IconButtonStyleHelper.fillPrimary,
                alignment: Alignment.centerRight,
                child: CustomImageView(
                  imagePath: ImageConstant.imgSend,
                  color: appTheme.whiteA700,
                ),
              ),
            ),
            CustomImageView(
              imagePath: img == '' ? 'assets/badges/1.jpeg' : img,
              height: 215.v,
              width: 220.h,
            ),
            Text(
              "lbl_congratulation".tr,
              style: CustomTextStyles.titleLargeInterBlack900,
            ),
            SizedBox(height: 17.v),
            Divider(
              color: appTheme.black900.withOpacity(0.08),
            ),
            SizedBox(height: 54.v),
            SizedBox(
              width: 263.h,
              child: Text(
                "You maintained a " +
                    streaks.toString() +
                    " day Streak and earned this badge. Keep it up",
                maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.titleSmallBlack900,
              ),
            ),
            SizedBox(height: 63.v),
            CustomElevatedButton(
              height: 57.v,
              width: 209.h,
              text: "lbl_see_all".tr,
              buttonStyle: CustomButtonStyles.fillPrimary,
              buttonTextStyle: CustomTextStyles.titleLargeInterGray50,
              onPressed: () {
                Get.back();
              },
            ),
            SizedBox(height: 5.v),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      backgroundColor: theme.colorScheme.primary,
      height: 90.v,
      leadingWidth: 64.h,
      leading: AppbarLeadingImage(
        onTap: () {
          Get.back();
        },
        color: appTheme.whiteA700,
        imagePath: ImageConstant.imgArrowDownWhiteA700,
        margin: EdgeInsets.only(
          left: 28.h,
          top: 40.v,
          bottom: 36.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        color: appTheme.whiteA700,
        text: "lbl_my_badges".tr,
      ),
      styleType: Style.bgFill,
    );
  }
}
