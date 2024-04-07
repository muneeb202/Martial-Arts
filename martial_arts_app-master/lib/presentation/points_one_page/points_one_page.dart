import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/usersListTile.dart';
import 'controller/points_one_controller.dart';
import 'models/points_one_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';

class PointsOnePage extends StatelessWidget {
  PointsOnePage({Key? key}) : super(key: key);

  PointsOneController controller =
      Get.put(PointsOneController(PointsOneModel().obs));

  @override
  Widget build(BuildContext context) {
    controller.fetchTopUsersByPoints();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      // backgroundColor: Color.fromRGBO(255, 255, 255, 1),

      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,center
            children: [
              SizedBox(height: 18.v),
              Obx(() {
                if (controller.topUsersByPoints.isEmpty ||
                    controller.topUsersByPoints.isNull) {
                  return CircularProgressIndicator();
                } else {
                  return _buildMaskColumn5();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMaskColumn5() {
    return GetBuilder<PointsOneController>(builder: (controller) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          // padding: EdgeInsets.only(left: 27.h),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 4,
                        top: 59.v,
                        bottom: 2.v,
                      ),
                      child: _buildMaskColumn1(
                          frameText: "lbl_2".tr,
                          titleText: controller.topUsersByPoints.length > 1
                              ? controller.topUsersByPoints[1]['fullname']
                                      .split(" ")
                                      .first ??
                                  ""
                              : "",
                          spanText: controller.topUsersByPoints.length > 1
                              ? controller.topUsersByPoints[1]['points'] ?? ""
                              : "",
                          imagePath: controller.topUsersByPoints.length > 1
                              ? controller.topUsersByPoints[1]
                                      ['profilepic'] ??
                                  ""
                              : ""
                          // titleText: "lbl_mirayk".tr,
                          // spanText: "lbl_426".tr,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 22.h),
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
                                        controller.topUsersByPoints.length > 0
                                            ? controller.topUsersByPoints[0]
                                                    ['profilepic'] ??
                                                ""
                                            : "",
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
                                                overflow:
                                                    TextOverflow.ellipsis,
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
                                        controller.topUsersByPoints.length > 0
                                            ? controller.topUsersByPoints[0]
                                                        ['fullname']
                                                    .split(" ")
                                                    .first ??
                                                ""
                                            : "",
                                    dynamicText3:
                                        controller.topUsersByPoints.length > 0
                                            ? controller.topUsersByPoints[0]
                                                    ['points'] ??
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
                        left: 22.h,
                        top: 49.v,
                        bottom: 2.v,
                      ),
                      child: _buildMaskColumn2(
                          frameText: "lbl_3".tr,
                          titleText: controller.topUsersByPoints.length > 2
                              ? controller.topUsersByPoints[2]['fullname']
                                      .split(" ")
                                      .first ??
                                  ""
                              : "",
                          spanText: controller.topUsersByPoints.length > 2
                              ? controller.topUsersByPoints[2]['points'] ?? ""
                              : "",
                          imagePath: controller.topUsersByPoints.length > 2
                              ? controller.topUsersByPoints[2]
                                      ['profilepic'] ??
                                  ""
                              : ""),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 6.h,left: 4.h, top: 15),
                  child: Card(
                    elevation: 1,
                    color: appTheme.whiteA700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: appTheme.whiteA700,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
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
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
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
                Obx(() => userListTile(controller.filteredUsers)),
                // userListTile(controller),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      );
    });
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
          SizedBox(height: 11.v),
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
                overflow: TextOverflow.ellipsis,
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
                overflow: TextOverflow.ellipsis,
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
                    overflow: TextOverflow.ellipsis,
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
                    overflow: TextOverflow.ellipsis,
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
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                streaksCounter,
                style: TextStyle(
                  color: appTheme.gray700.withOpacity(0.69),
                  fontSize: 13.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  overflow: TextOverflow.ellipsis,
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
