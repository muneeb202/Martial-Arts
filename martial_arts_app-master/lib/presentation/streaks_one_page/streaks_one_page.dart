import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'componets/streakUserListTile.dart';
import 'controller/streaks_one_controller.dart';
import 'models/streaks_one_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/widgets/custom_search_view.dart';

class StreaksOnePage extends StatelessWidget {
  StreaksOnePage({Key? key}) : super(key: key);

  StreaksOneController controller =
      Get.put(StreaksOneController(StreaksOneModel().obs));

  @override
  Widget build(BuildContext context) {
    controller.fetchTopUsersByStreaks();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 18.v),
                Obx(() {
                  if (controller.topUsersByStreaks.isEmpty ||
                      controller.topUsersByStreaks.isNull) {
                    return CircularProgressIndicator();
                  } else {
                    return _buildMaskColumn5();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMaskColumn5() {
    return Align(
      alignment: Alignment.bottomRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 27.h),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 9.h,
                  right: 30.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 59.v,
                        bottom: 2.v,
                      ),
                      child: _buildMaskColumn1(
                          frameText: "lbl_2".tr,
                          titleText: controller.topUsersByStreaks.length > 1
                              ? controller.topUsersByStreaks[1]['fullname'] ??
                                  ""
                              : "",
                          spanText: controller.topUsersByStreaks.length > 1
                              ? controller.topUsersByStreaks[1]['streaks'] ?? ""
                              : "",
                          imagePath: controller.topUsersByStreaks.length > 1
                              ? controller.topUsersByStreaks[1]['profilepic'] ??
                                  ""
                              : ""),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.h),
                      child: Animate(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 90.adaptSize,
                              width: 90.adaptSize,
                              margin: EdgeInsets.only(left: 2.h),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath:
                                        controller.topUsersByStreaks.length > 1
                                            ? controller.topUsersByStreaks[0]
                                                    ['profilepic'] ??
                                                ImageConstant.imgDefault
                                            : ImageConstant.imgDefault,
                                    height: 70.adaptSize,
                                    width: 70.adaptSize,
                                    radius: BorderRadius.circular(
                                      35.h,
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgVectorPrimary,
                                    height: 90.adaptSize,
                                    width: 90.adaptSize,
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4.v),
                            SizedBox(
                              height: 164.v,
                              width: 97.h,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 21.h,
                                      top: 24.v,
                                      right: 21.h,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15.h),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 7.h,
                                            vertical: 1.v,
                                          ),
                                          decoration: AppDecoration
                                              .outlinePrimary2
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder10,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "lbl_1".tr,
                                              style: TextStyle(
                                                color:
                                                    theme.colorScheme.primary,
                                                fontSize: 16.fSize,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 14.v),
                                        Text(
                                          "lbl_amelia".tr,
                                          style: TextStyle(
                                            color: appTheme.gray900,
                                            fontSize: 15.fSize,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "lbl_720".tr,
                                          style: TextStyle(
                                            color: appTheme.whiteA700,
                                            fontSize: 20.fSize,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _buildMaskColumn(
                                    dynamicText1: "lbl_1".tr,
                                    dynamicText2:
                                        controller.topUsersByStreaks.length > 0
                                            ? controller.topUsersByStreaks[0]
                                                        ['fullname']
                                                    .split(" ")
                                                    .first ??
                                                ""
                                            : "",
                                    dynamicText3:
                                        controller.topUsersByStreaks.length > 0
                                            ? controller.topUsersByStreaks[0]
                                                    ['streaks'] ??
                                                ""
                                            : "",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).flipH(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 18.h,
                        top: 59.v,
                        bottom: 2.v,
                      ),
                      child: _buildMaskColumn2(
                          frameText: "lbl_3".tr,
                          titleText: controller.topUsersByStreaks.length > 2
                              ? controller.topUsersByStreaks[2]['fullname']
                                      .split(" ")
                                      .first ??
                                  ""
                              : "",
                          spanText: controller.topUsersByStreaks.length > 2
                              ? controller.topUsersByStreaks[2]['streaks'] ?? ""
                              : "",
                          imagePath: controller.topUsersByStreaks.length > 2
                              ? controller.topUsersByStreaks[2]['profilepic'] ??
                                  ""
                              : ""),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.h, top: 30),
                child: Card(
                  elevation: 1,
                  color: appTheme.whiteA700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      controller: controller.searchController,
                      onChanged: (value) {
                        controller
                            .filterUsers(); // Call filterUsers() method here
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.search),
                        prefixIconColor: Colors.grey.shade600,
                        hintText: "lbl_search_user".tr,
                        hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        fillColor: appTheme.whiteA700,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.h),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.h),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.h),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28.v),
              Obx(() => streakUserListTile(controller.filteredUsers)),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildMaskColumn({
    required String dynamicText1,
    required String dynamicText2,
    required String dynamicText3,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30.adaptSize,
            // margin: EdgeInsets.only(right: 12.h),
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 2.v,
            ),
            decoration: AppDecoration.outlinePrimary2.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder16,
            ),
            child: Center(
              child: Text(
                dynamicText1,
                style: GoogleFonts.montserrat(
                  color: theme.colorScheme.primary,
                  fontSize: 20.fSize,
                  // fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 9.v),
          Text(
            dynamicText2,
            style: TextStyle(
              color: appTheme.gray900,
              fontSize: 15.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 42.v),
          Text(
            dynamicText3,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16.fSize,
              // fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildMaskColumn1(
      {required String frameText,
      required String titleText,
      required String spanText,
      required String imagePath}) {
    return Animate(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: imagePath.isEmpty ? ImageConstant.imgDefault : imagePath,
            height: 70.adaptSize,
            width: 70.adaptSize,
            radius: BorderRadius.circular(
              35.h,
            ),
          ),
          SizedBox(
            height: 11.v,
          ),
          Container(
            // height: selected.value ? 130 : 0,
            padding: EdgeInsets.symmetric(
              horizontal: 19.h,
              vertical: 12.v,
            ),
            decoration: AppDecoration.fillPrimary2.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder10,
              color: Color.fromRGBO(255, 92, 0, .6),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // width: 30.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.h,
                    vertical: 2.v,
                  ),
                  decoration: AppDecoration.outlinePrimary2.copyWith(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      frameText,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: theme.colorScheme.primary,
                        fontSize: 20.fSize,
                        // fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.v),
                Text(
                  titleText.length > 6
                      ? titleText.substring(0, 4) + '...'
                      : titleText,
                  style: TextStyle(
                    color: appTheme.gray900,
                    fontSize: 14.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 13.v),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: spanText,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16.fSize,
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    ).scale();
  }

  Widget _buildMaskColumn2(
      {required String frameText,
      required String titleText,
      required String spanText,
      required String imagePath}) {
    return Animate(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: imagePath.isEmpty ? ImageConstant.imgDefault : imagePath,
            height: 70.adaptSize,
            width: 70.adaptSize,
            radius: BorderRadius.circular(
              35.h,
            ),
          ),
          SizedBox(height: 11.v),
          Container(
            // height: selected.value ? 130 : 0,
            padding: EdgeInsets.symmetric(
              horizontal: 19.h,
              vertical: 8.v,
            ),
            decoration: AppDecoration.fillPrimary2.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder10,
              color: Color.fromRGBO(255, 92, 0, .3),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // width: 30.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.h,
                    vertical: 2.v,
                  ),
                  decoration: AppDecoration.outlinePrimary2.copyWith(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      frameText,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: theme.colorScheme.primary,
                        fontSize: 20.fSize,
                        // fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7.v),
                Text(
                  titleText.length > 6
                      ? titleText.substring(0, 4) + '...'
                      : titleText,
                  style: TextStyle(
                    color: appTheme.gray900,
                    fontSize: 14.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 8.v),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: spanText,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16.fSize,
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    ).scale();
  }

  /// Common widget
  Widget _buildZeroStackRow({
    required String zero,
    required String emoji,
  }) {
    return SizedBox(
      height: 30.v,
      width: 20.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              zero,
              style: TextStyle(
                color: appTheme.whiteA700,
                fontSize: 12.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              emoji,
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 20.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildZeroStackRow1({
    required String zero,
    required String emoji,
    required String title,
    required String streaksCounter,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30.v,
          width: 20.h,
          margin: EdgeInsets.only(
            top: 5.v,
            bottom: 4.v,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  zero,
                  style: TextStyle(
                    color: appTheme.whiteA700,
                    fontSize: 12.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  emoji,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 20.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                streaksCounter,
                style: TextStyle(
                  color: appTheme.gray700.withOpacity(0.69),
                  fontSize: 13.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgPlayWhiteA700,
          height: 28.adaptSize,
          width: 28.adaptSize,
          margin: EdgeInsets.only(
            left: 112.h,
            top: 5.v,
            bottom: 4.v,
          ),
        ),
      ],
    );
  }
}
