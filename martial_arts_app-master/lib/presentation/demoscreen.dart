
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/widgets/custom_search_view.dart';

import 'points_one_page/controller/points_one_controller.dart';
import 'points_one_page/models/points_one_model.dart';

class PointsOnePaged extends StatelessWidget {
  PointsOnePaged({Key? key}) : super(key: key);

  PointsOneController controller =
      Get.put(PointsOneController(PointsOneModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            width: SizeUtils.width,
            child: Column(
              children: [
                SizedBox(height: 17.v),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 27.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPlaylist(),
                        Padding(
                          padding: EdgeInsets.only(right: 20.h),
                          child: Card(
                            elevation: 1,
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            child: CustomSearchView(
                              controller: controller.searchController,
                              hintText: "lbl_search_user".tr,
                            ),
                          ),
                        ),
                        SizedBox(height: 26.v),
                        _buildUserProfile(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPlaylist() {
    return Padding(
      padding: EdgeInsets.only(
        left: 9.h,
        right: 30.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 50.v,
              bottom: 2.v,
            ),
            child: _buildReviews(
              frameText: "lbl_2".tr,
              titleText: "lbl_mirayk".tr,
              subtitleText: "lbl_713".tr,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90.adaptSize,
                  width: 90.adaptSize,
                  margin: EdgeInsets.only(left: 1.h),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgMask70x70,
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
                SizedBox(height: 6.v),
                SizedBox(
                  height: 164.v,
                  width: 97.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 21.h,
                            top: 24.v,
                            right: 21.h,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15.h),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.h,
                                  vertical: 1.v,
                                ),
                                decoration:
                                    AppDecoration.outlinePrimary2.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder10,
                                ),
                                child: Text(
                                  "lbl_1".tr,
                                  style: TextStyle(
                                    color: theme.colorScheme.primary,
                                    fontSize: 16.fSize,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.v),
                              Text(
                                "lbl_amelia".tr,
                                style: TextStyle(
                                  color: appTheme.gray900,
                                  fontSize: 15.fSize,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 7.h),
                                  child: Expanded(
                                    child: Text(
                                      "lbl_720".tr,
                                      style: TextStyle(
                                        color: appTheme.whiteA700,
                                        fontSize: 20.fSize,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildClientTestimonials(
                        dynamicText1: "lbl_1".tr,
                        dynamicText2: "lbl_amelia".tr,
                        dynamicText3: "lbl_7202".tr,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 18.h,
              top: 61.v,
              bottom: 2.v,
            ),
            child: _buildReviews(
              frameText: "lbl_3".tr,
              titleText: "lbl_onur_o".tr,
              subtitleText: "lbl_684".tr,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicWidth(
        child: SizedBox(
          height: 600.v,
          width: 366.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 600.v,
                  width: 346.h,
                  decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    borderRadius: BorderRadius.circular(
                      30.h,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: appTheme.deepOrange10001,
                        spreadRadius: 2.h,
                        blurRadius: 2.h,
                        offset: Offset(
                          0,
                          2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 7.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        margin: EdgeInsets.all(0),
                        color: appTheme.whiteA700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.circleBorder16,
                        ),
                        child: Container(
                          height: 68.v,
                          width: 329.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 13.v,
                          ),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder16,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 36.adaptSize,
                                  width: 36.adaptSize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      18.h,
                                    ),
                                    border: Border.all(
                                      color: appTheme.indigoA700,
                                      width: 2.h,
                                    ),
                                  ),
                                ),
                              ),
                              _buildRecentOrders(
                                zero: "lbl_0".tr,
                                emoji: "lbl_1".tr,
                                title: "lbl_amelia_tovias".tr,
                                pointsCounter: "lbl_720_points".tr,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30.h),
                        padding: EdgeInsets.all(16.h),
                        decoration: AppDecoration.fillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder16,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 36.adaptSize,
                              width: 36.adaptSize,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 36.adaptSize,
                                      width: 36.adaptSize,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          18.h,
                                        ),
                                        border: Border.all(
                                          color: appTheme.indigoA700,
                                          width: 2.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 2.v),
                                    child: _buildDoctorReviews(
                                      zero: "lbl_0".tr,
                                      emoji: "lbl_2".tr,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "msg_mirayk_cirrincione".tr,
                                    style: TextStyle(
                                      color: theme.colorScheme.primary,
                                      fontSize: 14.fSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "lbl_713_points".tr,
                                    style: TextStyle(
                                      color: appTheme.gray500,
                                      fontSize: 12.fSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            CustomImageView(
                              imagePath: ImageConstant.imgPlayWhiteA700,
                              height: 28.adaptSize,
                              width: 28.adaptSize,
                              margin: EdgeInsets.symmetric(vertical: 4.v),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68.v,
                        width: 359.h,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 68.v,
                                width: 329.h,
                                decoration: BoxDecoration(
                                  color: appTheme.whiteA700,
                                  borderRadius: BorderRadius.circular(
                                    16.h,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 16.h,
                                  top: 16.v,
                                  bottom: 16.v,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 36.adaptSize,
                                      width: 36.adaptSize,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              height: 36.adaptSize,
                                              width: 36.adaptSize,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  18.h,
                                                ),
                                                border: Border.all(
                                                  color: appTheme.indigoA700,
                                                  width: 2.h,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "lbl_0".tr,
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
                                              "lbl_3".tr,
                                              style: TextStyle(
                                                color:
                                                    theme.colorScheme.primary,
                                                fontSize: 20.fSize,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 24.v,
                                      width: 25.h,
                                      margin: EdgeInsets.only(top: 10.v),
                                      decoration: BoxDecoration(
                                        color: appTheme.red100,
                                        borderRadius: BorderRadius.circular(
                                          4.h,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: appTheme.deepOrange50,
                                            spreadRadius: 2.h,
                                            blurRadius: 2.h,
                                            offset: Offset(
                                              0,
                                              0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(64.h, 14.v, 46.h, 16.v),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_onur_o".tr,
                                          style: TextStyle(
                                            color: theme.colorScheme.primary,
                                            fontSize: 15.fSize,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "lbl_684_points".tr,
                                          style: TextStyle(
                                            color: appTheme.gray700
                                                .withOpacity(0.69),
                                            fontSize: 12.fSize,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgPlayWhiteA700,
                                      height: 28.adaptSize,
                                      width: 28.adaptSize,
                                      margin: EdgeInsets.only(
                                        top: 5.v,
                                        bottom: 3.v,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.h,
                          vertical: 13.v,
                        ),
                        decoration: AppDecoration.fillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder16,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 36.adaptSize,
                              width: 36.adaptSize,
                              margin: EdgeInsets.symmetric(vertical: 2.v),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 36.adaptSize,
                                      width: 36.adaptSize,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          18.h,
                                        ),
                                        border: Border.all(
                                          color: appTheme.indigoA700,
                                          width: 2.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                  _buildDoctorReviews(
                                    zero: "lbl_0".tr,
                                    emoji: "lbl_4".tr,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.h),
                              child: _buildText(
                                titleText: "lbl_amelia_tovias".tr,
                                pointsText: "lbl_680_points".tr,
                              ),
                            ),
                            Spacer(),
                            CustomImageView(
                              imagePath: ImageConstant.imgPlayWhiteA700,
                              height: 28.adaptSize,
                              width: 28.adaptSize,
                              margin: EdgeInsets.symmetric(vertical: 6.v),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        margin: EdgeInsets.all(0),
                        color: appTheme.whiteA700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.circleBorder16,
                        ),
                        child: Container(
                          height: 68.v,
                          width: 329.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 13.v,
                          ),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder16,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 36.adaptSize,
                                  width: 36.adaptSize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      18.h,
                                    ),
                                    border: Border.all(
                                      color: appTheme.indigoA700,
                                      width: 2.h,
                                    ),
                                  ),
                                ),
                              ),
                              _buildRecentOrders(
                                zero: "lbl_0".tr,
                                emoji: "lbl_4".tr,
                                title: "lbl_amelia_tovias".tr,
                                pointsCounter: "lbl_680_points".tr,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30.h),
                        padding: EdgeInsets.all(16.h),
                        decoration: AppDecoration.fillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder16,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 36.adaptSize,
                              width: 36.adaptSize,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 36.adaptSize,
                                      width: 36.adaptSize,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          18.h,
                                        ),
                                        border: Border.all(
                                          color: appTheme.indigoA700,
                                          width: 2.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                  _buildDoctorReviews(
                                    zero: "lbl_0".tr,
                                    emoji: "lbl_5".tr,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 34.v,
                              width: 125.h,
                              margin: EdgeInsets.only(left: 11.h),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 1.h),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "lbl_layla_schupbach".tr,
                                            style: TextStyle(
                                              color: theme.colorScheme.primary,
                                              fontSize: 14.fSize,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            "lbl_633_points".tr,
                                            style: TextStyle(
                                              color: appTheme.gray500,
                                              fontSize: 12.fSize,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 2.v),
                                      child: SizedBox(
                                        width: 42.h,
                                        child: Divider(
                                          color: appTheme.red700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 28.v,
                              width: 48.h,
                              margin: EdgeInsets.symmetric(vertical: 4.v),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgPlayWhiteA700,
                                    height: 28.adaptSize,
                                    width: 28.adaptSize,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20.h),
                                      padding: EdgeInsets.all(6.h),
                                      decoration:
                                          AppDecoration.outlineWhiteA.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder16,
                                      ),
                                      child: Text(
                                        "lbl_32".tr.toUpperCase(),
                                        style: TextStyle(
                                          color: appTheme.indigoA700,
                                          fontSize: 10.fSize,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
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
                      Container(
                        margin: EdgeInsets.only(right: 30.h),
                        padding: EdgeInsets.all(16.h),
                        decoration: AppDecoration.fillWhiteA700.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder16,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              margin: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: appTheme.blueGray5001,
                                  width: 2.h,
                                ),
                                borderRadius: BorderRadiusStyle.roundedBorder20,
                              ),
                              child: Container(
                                height: 36.adaptSize,
                                width: 36.adaptSize,
                                decoration:
                                    AppDecoration.outlineBlueGray.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder20,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 36.adaptSize,
                                        width: 36.adaptSize,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            18.h,
                                          ),
                                          border: Border.all(
                                            color: appTheme.indigoA700,
                                            width: 2.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                    _buildDoctorReviews(
                                      zero: "lbl_0".tr,
                                      emoji: "lbl_4".tr,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.h),
                              child: Column(
                                children: [
                                  Text(
                                    "lbl_amelia_tovias".tr,
                                    style: TextStyle(
                                      color: theme.colorScheme.primary,
                                      fontSize: 15.fSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "lbl_680_points".tr,
                                    style: TextStyle(
                                      color: appTheme.gray700.withOpacity(0.69),
                                      fontSize: 12.fSize,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgPlay,
                              height: 28.adaptSize,
                              width: 28.adaptSize,
                              // color: Colors.black,
                              margin: EdgeInsets.only(
                                left: 12.h,
                                top: 4.v,
                                bottom: 4.v,
                              ),
                            ),
                          ],
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
    );
  }

  /// Common widget
  Widget _buildClientTestimonials({
    required String dynamicText1,
    required String dynamicText2,
    required String dynamicText3,
  }) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        //  vertical: 14.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 30.adaptSize,
              margin: EdgeInsets.only(right: 12.h),
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 2.v,
              ),
              decoration: AppDecoration.outlinePrimary2.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder16,
              ),
              child: Text(
                dynamicText1,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 20.fSize,
                  fontFamily: 'Inter',
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
            ),
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(left: 3.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "  ".tr,
                  ),
                  TextSpan(
                    text: "lbl_7203".tr,
                    style: CustomTextStyles.headlineSmallPoppinsffffffff,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildReviews({
    required String frameText,
    required String titleText,
    required String subtitleText,
  }) {
    return Column(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgMask1,
          height: 70.adaptSize,
          width: 70.adaptSize,
          radius: BorderRadius.circular(
            35.h,
          ),
        ),
        SizedBox(height: 11.v),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 19.h,
            vertical: 12.v,
          ),
          decoration: AppDecoration.fillPrimary2.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 30.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.h,
                    vertical: 2.v,
                  ),
                  decoration: AppDecoration.outlinePrimary2.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder16,
                  ),
                  child: Text(
                    frameText,
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 20.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.v),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  titleText,
                  style: TextStyle(
                    color: appTheme.gray900,
                    fontSize: 14.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 12.v),
              Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "   ".tr,
                      ),
                      TextSpan(
                        text: "lbl_6842".tr,
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildDoctorReviews({
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
  Widget _buildText({
    required String titleText,
    required String pointsText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontSize: 15.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          pointsText,
          style: TextStyle(
            color: appTheme.gray700.withOpacity(0.69),
            fontSize: 13.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildRecentOrders({
    required String zero,
    required String emoji,
    required String title,
    required String pointsCounter,
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
                pointsCounter,
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
