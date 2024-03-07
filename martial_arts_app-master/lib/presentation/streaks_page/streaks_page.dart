import 'controller/streaks_controller.dart';
import 'models/streaks_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/widgets/custom_search_view.dart';

class StreaksPage extends StatelessWidget {
  StreaksPage({Key? key}) : super(key: key);

  StreaksController controller = Get.put(StreaksController(StreaksModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 18.v),
                _buildHorizontalScroll(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalScroll() {
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
                        titleText: "lbl_mirayk".tr,
                        spanText: "lbl_426".tr,
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
                            margin: EdgeInsets.only(left: 2.h),
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
                          SizedBox(height: 4.v),
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
                                                .circleBorder35,
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
                                      ],
                                    ),
                                  ),
                                ),
                                _buildMaskColumn(
                                  dynamicText1: "lbl_1".tr,
                                  dynamicText2: "lbl_amelia".tr,
                                  dynamicText3: "lbl_5002".tr,
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
                        top: 59.v,
                        bottom: 2.v,
                      ),
                      child: _buildMaskColumn1(
                        frameText: "lbl_3".tr,
                        titleText: "lbl_onur_o".tr,
                        spanText: "lbl_412".tr,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.h),
                child: CustomSearchView(
                  controller: controller.searchController,
                  hintText: "lbl_search_user".tr,
                  borderDecoration: SearchViewStyleHelper.outlineGrayTL20,
                ),
              ),
              SizedBox(height: 28.v),
              SizedBox(
                height: 433.v,
                width: 366.h,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 433.v,
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
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 34.v),
                        child: SizedBox(
                          width: 113.h,
                          child: Divider(
                            color: appTheme.red700,
                            indent: 71.h,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 7.h,
                          top: 14.v,
                        ),
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
                                decoration:
                                    AppDecoration.fillWhiteA700.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder16,
                                ),
                                child: Stack(
                                  alignment: Alignment.topCenter,
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
                                    _buildZero1(
                                      zero: "lbl_0".tr,
                                      emoji: "lbl_1".tr,
                                      title: "lbl_amelia_tovias".tr,
                                      streaksCounter: "lbl_500_streaks".tr,
                                    ),
                                  ],
                                ),
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
                                padding: EdgeInsets.all(16.h),
                                decoration:
                                    AppDecoration.fillWhiteA700.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder16,
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
                                    Align(
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 1.v,
                                              bottom: 3.v,
                                            ),
                                            child: _buildZero(
                                              zero: "lbl_0".tr,
                                              emoji: "lbl_2".tr,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.h),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "msg_mirayk_cirrincione".tr,
                                                  style: TextStyle(
                                                    color: theme
                                                        .colorScheme.primary,
                                                    fontSize: 14.fSize,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  "lbl_426_streaks".tr,
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
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgPlayWhiteA700,
                                            height: 28.adaptSize,
                                            width: 28.adaptSize,
                                            margin: EdgeInsets.only(
                                              left: 87.h,
                                              top: 1.v,
                                              bottom: 3.v,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                                                        color:
                                                            appTheme.indigoA700,
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
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "lbl_3".tr,
                                                    style: TextStyle(
                                                      color: theme
                                                          .colorScheme.primary,
                                                      fontSize: 20.fSize,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 24.v,
                                            width: 25.h,
                                            margin: EdgeInsets.only(
                                              top: 8.v,
                                              bottom: 4.v,
                                            ),
                                            decoration: BoxDecoration(
                                              color: appTheme.red100,
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          64.h, 15.v, 46.h, 15.v),
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
                                                  color:
                                                      theme.colorScheme.primary,
                                                  fontSize: 15.fSize,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                "lbl_412_streaks".tr,
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
                                            imagePath:
                                                ImageConstant.imgPlayWhiteA700,
                                            height: 28.adaptSize,
                                            width: 28.adaptSize,
                                            margin: EdgeInsets.only(
                                              top: 5.v,
                                              bottom: 4.v,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                  vertical: 15.v,
                                ),
                                decoration:
                                    AppDecoration.fillWhiteA700.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder16,
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
                                    Align(
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 1.v,
                                              bottom: 3.v,
                                            ),
                                            child: _buildZero(
                                              zero: "lbl_0".tr,
                                              emoji: "lbl_4".tr,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.h),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "lbl_layla_schupbach".tr,
                                                  style: TextStyle(
                                                    color: theme
                                                        .colorScheme.primary,
                                                    fontSize: 14.fSize,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  "lbl_388_streaks".tr,
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
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgPlayWhiteA700,
                                            height: 28.adaptSize,
                                            width: 28.adaptSize,
                                            margin: EdgeInsets.only(
                                              left: 97.h,
                                              top: 1.v,
                                              bottom: 3.v,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                                decoration:
                                    AppDecoration.fillWhiteA700.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder16,
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
                                    _buildZero1(
                                      zero: "lbl_0".tr,
                                      emoji: "lbl_5".tr,
                                      title: "lbl_amelia_tovias".tr,
                                      streaksCounter: "lbl_378_streaks".tr,
                                    ),
                                  ],
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
          SizedBox(height: 42.v),
          Align(
            alignment: Alignment.center,
            child: Text(
              dynamicText3,
              style: TextStyle(
                color: appTheme.whiteA700,
                fontSize: 20.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildMaskColumn1({
    required String frameText,
    required String titleText,
    required String spanText,
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
              SizedBox(height: 13.v),
              Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "   ".tr,
                      ),
                      TextSpan(
                        text: "lbl_4122".tr,
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
  Widget _buildZero({
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
  Widget _buildZero1({
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
