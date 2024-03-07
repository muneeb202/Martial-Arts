// ignore_for_file: must_be_immutable

import 'package:google_fonts/google_fonts.dart';

import 'controller/points_tab_container_controller.dart';
import 'models/points_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/points_one_page/points_one_page.dart';
import 'package:martial_art/presentation/streaks_one_page/streaks_one_page.dart';
import 'package:martial_art/widgets/app_bar/appbar_leading_image.dart';
import 'package:martial_art/widgets/app_bar/appbar_title.dart';
import 'package:martial_art/widgets/app_bar/custom_app_bar.dart';

class PointsTabContainerPage extends StatelessWidget {
  PointsTabContainerPage({Key? key}) : super(key: key);

  PointsTabContainerController controller =
      Get.put(PointsTabContainerController(PointsTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: Column(
                  children: [
                    Container(
                      height: Get.width / 0.9,
                      width: Get.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height / 3.1,
                      width: Get.width,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 26.v),
                  _buildPointsSection(),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabviewController,
                      children: [
                        PointsOnePage(),
                        StreaksOnePage(),
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
  Widget _buildPointsSection() {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 17.h),
      child: Column(
        children: [
          CustomAppBar(
            height: 39.v,
            leadingWidth: 64.h,
            leading: AppbarLeadingImage(
              onTap: () {
              },
              color: appTheme.whiteA700,
              imagePath: ImageConstant.imgArrowDown,
              margin: EdgeInsets.only(
                left: 28.h,
                top: 13.v,
                bottom: 11.v,
              ),
            ),
            centerTitle: true,
            title: AppbarTitle(
              color: appTheme.whiteA700,
              text: "lbl_leaderboard".tr,

            ),
          ),
          SizedBox(height: 10.v),
          Container(
            height: 32.v,
            width: 358.h,
            decoration: BoxDecoration(
              color: appTheme.deepOrange10002,
              borderRadius: BorderRadius.circular(
                16.h,
              ),
            ),
            child: TabBar(
              controller: controller.tabviewController,
              labelPadding: EdgeInsets.zero,
              labelColor: appTheme.orangeA200,
              labelStyle: GoogleFonts.montserrat(
                fontSize: 14.fSize,
                // fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelColor: appTheme.blueGray500,
              unselectedLabelStyle: GoogleFonts.montserrat(
                fontSize: 14.fSize,
                // fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
              indicatorPadding: EdgeInsets.all(
                4.0.h,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: appTheme.whiteA700,
                borderRadius: BorderRadius.circular(
                  22.h,
                ),
                border: Border.all(
                  color: appTheme.deepOrange100,
                  width: 1.h,
                ),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.black900.withOpacity(0.05),
                    spreadRadius: 2.h,
                    blurRadius: 2.h,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              tabs: [
                Tab(
                  child: Text(
                    "lbl_points".tr,
                    style: GoogleFonts.montserrat(
                      // color: theme.colorScheme.primary,
                      fontSize: 16.fSize,
                      // fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),

                  ),
                ),
                Tab(
                  child: Text(
                    "lbl_streaks".tr,
                    style: GoogleFonts.montserrat(
                      // color: theme.colorScheme.primary,
                      fontSize: 16.fSize,
                      // fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
