import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'controller/badges_detail_controller.dart';
import '/core/app_export.dart';
import '/widgets/app_bar/appbar_leading_image.dart';
import '/widgets/app_bar/appbar_title.dart';
import '/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

// ignore_for_file: must_be_immutable
class BadgesDetailScreen extends GetWidget<BadgesDetailController> {
  const BadgesDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 11.v),
            child: Column(
              children: [
                // Padding(
                //   padding: EdgeInsets.only(right: 34.h),
                //   child: CustomIconButton(
                //     height: 60.adaptSize,
                //     width: 60.adaptSize,
                //     padding: EdgeInsets.all(18.h),
                //     decoration: IconButtonStyleHelper.fillPrimary,
                //     alignment: Alignment.centerRight,
                //     child: CustomImageView(
                //       imagePath: ImageConstant.imgSend,
                //       color: appTheme.whiteA700,
                //     ),
                //   ),
                // ),
                CustomImageView(
                  onTap: () {
                    Get.toNamed(AppRoutes.detailPageScreen);
                  },
                  imagePath: ImageConstant.imgCoinSpecial,
                  // height: 255.v,
                  width: 280.h,
                ),
                Container(
                  // height: 220,
                  // width: 300,
                  decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "lbl_month_title".tr,
                          style: CustomTextStyles.titleLargeInterBlack900,
                        ),
                        SizedBox(height: 15.v),
                        SizedBox(
                          width: 263.h,
                          child: Text(
                            "msg_for_month".tr,
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.titleSmallBlack900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.v),
          CustomElevatedButton(
            height: 57.v,
            width: 209.h,
            text: "Back",
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: CustomTextStyles.titleLargeInterGray50,
            onPressed: () {
              Get.back();
            },
          ),
          SizedBox(height: 5.v),
        ],
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      backgroundColor: theme.colorScheme.primary,
      height: 90.v,
      // leadingWidth: 64.h,
      leading: AppbarLeadingImage(
        onTap: () {
          Get.back();
        },
        color: appTheme.whiteA700,
        imagePath: ImageConstant.imgArrowDownWhiteA700,
        margin: EdgeInsets.only(
          left: 5,
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
