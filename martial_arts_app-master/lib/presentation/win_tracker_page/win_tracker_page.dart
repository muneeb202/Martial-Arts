import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/app_bar/appbar_subtitle.dart';
import 'controller/win_tracker_controller.dart';
import 'models/studentactivitieslist_item_model.dart';
import 'models/win_tracker_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/widgets/app_bar/custom_app_bar.dart';
import 'widgets/studentactivitieslist_item_widget.dart';

// ignore: must_be_immutable
class WinTrackerPage extends StatelessWidget {
  WinTrackerPage({Key? key}) : super(key: key);

  WinTrackerController controller =
      Get.put(WinTrackerController(WinTrackerModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),

        // backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            _buildBackgroundImages(),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Animate(
                      effects: [FadeEffect(), ScaleEffect()],
                      child: _buildProfile()),
                  Animate(
                      effects: [FadeEffect(), ScaleEffect()],
                      child: _buildHeaderBg()),
                  Animate(child: _buildStudentActivitiesTitle()).slideX(),
                  Animate(child: _buildStudentActivitiesList()).slideX(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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

  Widget _buildBackgroundImages() {
    return Positioned.fill(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CustomImageView(
              imagePath: ImageConstant.imgEllipse186426x119,
              height: 560.v,
              width: 170.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(25.h, 20.v, 30.h, 12.v),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "msg_sun_1_january_2024".tr,
                    style: TextStyle(
                      color: appTheme.gray700,
                      fontSize: 13.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_hello".tr,
                          style: GoogleFonts.montserrat(
                            color: Color(0XFF6A6767),
                            fontSize: 23.fSize,
                      // fontFamily: 'Nunito',
                      // fontWeight: FontWeight.w700,
                    ),
                        ),
                        TextSpan(
                          text: " ",
                        ),
                        TextSpan(
                          text: "lbl_wahab".tr,
                          style:GoogleFonts.montserrat(
                            color: Color(0XFF2E2E2E),
                            fontSize: 23.fSize,
                            fontWeight: FontWeight.w700,
                  ),
                        ),
                        TextSpan(
                          text: "lbl".tr,
                          style:
                              CustomTextStyles.titleLargeNunitoff2e2e2eRegular,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            // CustomImageView(
            //   imagePath: ImageConstant.imgContrast,
            //   height: 42.adaptSize,
            //   width: 42.adaptSize,
            //   // margin: EdgeInsets.only(bottom: 25.v),
            //   color: theme.colorScheme.primary,
            // ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: theme.colorScheme.primary, width: 3),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: .5,
                      blurRadius: 1,
                      offset: Offset(3, 3), // This defines the shadow position, adjust as needed
                    ),
                  ]
              ),
              child: Center(
                child: Icon(
                  Icons.person_outline,
                  color: theme.colorScheme.primary,
                  size: 42.adaptSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHeaderBg() {
    return Card(
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.orange, // Set shadow color
      elevation: 5,
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
                imagePath: ImageConstant.imgEllipse1,
                height: 148.v,
                width: 311.h,
                alignment: Alignment.centerLeft,
              ),
            ),
            Opacity(
              opacity: 0.5,
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse2,
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
                    padding: EdgeInsets.symmetric(
                      vertical: 6.v,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 139.h,
                          child: Text(
                            "msg_my_plans_for_today".tr,
                            maxLines: 2,
                            style: GoogleFonts.montserrat(
                              color: appTheme.whiteA700,
                              fontSize: 22.fSize,
                              // fontFamily: 'Inter',
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
                            fontFamily: 'poppins',
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
                              color: appTheme.whiteA700,
                              backgroundColor: appTheme.deepOrange200,
                              value: 30 / 100,
                              strokeWidth: 15,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Center(
                              child: Text(
                                "lbl_30".tr,
                                style: GoogleFonts.montserrat(
                                  color: Colors.deepOrange,
                                  fontSize: 19.fSize,
                                  // fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700,
                                ),
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

  Widget _buildStudentActivitiesTitle() {
    return Padding(
      padding: EdgeInsets.only(
        left: 13.h,
        right: 23.h,
        top: 20.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 14.h),
            child: Text(
              "msg_ongoing_activities".tr,
              style: GoogleFonts.montserrat(
                color: appTheme.blueGray900,
                fontSize: 21.fSize,
                // fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(
          //     top: 7.v,
          //     bottom: 5.v,
          //   ),
          //   child: Text(
          //     "lbl_view_all".tr,
          //     style: GoogleFonts.poppins(
          //       color: theme.colorScheme.primary,
          //       fontSize: 11.fSize,
          //       // fontFamily: 'Nunito',
          //       fontWeight: FontWeight.w700,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildStudentActivitiesList() {
    return Padding(
      padding: EdgeInsets.only(
        left: 13.h,
        right: 13.h,
        top: 20.v,
        bottom: 40.v,
      ),
      child: Obx(
        () => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 6.v,
            );
          },
          itemCount: controller.winTrackerModelObj.value
              .studentactivitieslistItemList.value.length,
          itemBuilder: (context, index) {
            StudentactivitieslistItemModel model = controller.winTrackerModelObj
                .value.studentactivitieslistItemList.value[index];
            return StudentactivitieslistItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
