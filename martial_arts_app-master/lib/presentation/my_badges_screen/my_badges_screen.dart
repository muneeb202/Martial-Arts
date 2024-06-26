import 'package:google_fonts/google_fonts.dart';
import 'package:martial_art/presentation/reward_info_screen/reward_info_screen.dart';

import 'controller/my_badges_controller.dart';
import '/core/app_export.dart';
import '/widgets/app_bar/appbar_leading_image.dart';
import '/widgets/app_bar/appbar_title.dart';
import '/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class MyBadgesScreen extends GetWidget<MyBadgesController> {
  const MyBadgesScreen({Key? key}) : super(key: key);

  Widget _buildRewardCard(String img, String games, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        overlayColor: MaterialStatePropertyAll(Colors.white),
        child: Container(
          height: 160,
          child: Column(
            children: [
              Container(
                height: 120,
                // child: ,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                games,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  // color: Colors.black,
                  fontSize: 12.fSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Obx(() {
            if (controller.streaks == -1) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: (MediaQuery.of(context).size.height/2)-150,
                    ),
                    CircularProgressIndicator(
                      strokeWidth: 5,

                    ),
                  ],
                ),
              ); // Show loading indicator
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: controller.streaks.value >-1 &&  controller.streaks.value <3,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Streaks!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  "Every journey begins with a single step. Start yours today and watch your achievements grow!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.deepOrange.withOpacity(0.8),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  "Keep up the streak to earn badges:",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  "First Badge awarded after 3 days streaks",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.deepOrange.withOpacity(0.8),
                                  ),
                                ),
                                Text(
                                  "Second Badge awarded after 6 days streaks",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.deepOrange.withOpacity(0.8),
                                  ),
                                ),
                                Text(
                                  ".",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.deepOrange.withOpacity(0.5),
                                  ),
                                ),
                                Text(
                                  ".",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.deepOrange.withOpacity(0.8),
                                  ),
                                ),
                                Text(
                                  ".",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                Text(
                                  "After 1 month streak 10 badges and\nqualified for monthly reward",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.deepOrange.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Visibility(
                          visible: controller.streaks >= 3,
                          child: _buildRewardCard(
                              'assets/badgesPics/b1.png', 'White Belt', () {
                            Get.to(
                              RewardInfoScreen(
                                img: 'assets/badgesPics/b1.png',
                                streaks: 3,
                              ),
                            );
                          }),
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: controller.streaks >= 6,
                          child: _buildRewardCard(
                              'assets/badgesPics/b2.png', 'Orange Belt', () {
                            Get.to(
                              RewardInfoScreen(
                                img: 'assets/badgesPics/b2.png',
                                streaks: 6,
                              ),
                            );
                          }),
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: controller.streaks >= 9,
                          child: _buildRewardCard(
                              'assets/badgesPics/b3.png', 'Red Belt', () {
                            Get.to(
                              RewardInfoScreen(
                                img: 'assets/badgesPics/b3.png',
                                streaks: 9,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Visibility(
                          visible: controller.streaks >= 12,
                          child: _buildRewardCard(
                              'assets/badgesPics/b4.png', 'Yellow Belt', () {
                            Get.to(
                              RewardInfoScreen(
                                img: 'assets/badgesPics/b4.png',
                                streaks: 12,
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Visibility(
                          visible: controller.streaks >= 15,
                          child: _buildRewardCard(
                              'assets/badgesPics/b5.png', 'Green Belt', () {
                            Get.to(
                              RewardInfoScreen(
                                img: 'assets/badgesPics/b5.png',
                                streaks: 15,
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Visibility(
                          visible: controller.streaks >= 18,
                          child: _buildRewardCard(
                              'assets/badgesPics/b6.png', 'Purple Belt', () {
                            Get.to(
                              RewardInfoScreen(
                                img: 'assets/badgesPics/b6.png',
                                streaks: 18,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Visibility(
                          visible: controller.streaks >= 21,
                          child: _buildRewardCard(
                              'assets/badgesPics/b7.png', 'Purple/White Belt',
                              () {
                            Get.to(
                              RewardInfoScreen(
                                img: 'assets/badgesPics/b7.png',
                                streaks: 21,
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Visibility(
                          visible: controller.streaks >= 24,
                          child: _buildRewardCard(
                              'assets/badgesPics/b8.png', 'Brown Belt', () {
                            Get.to(
                              RewardInfoScreen(
                                img: 'assets/badgesPics/b8.png',
                                streaks: 24,
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Visibility(
                          visible: controller.streaks >= 27,
                          child: _buildRewardCard(
                              'assets/badgesPics/b9.png', 'Brown/White Belt',
                              () {
                            Get.to(
                              RewardInfoScreen(
                                img: 'assets/badgesPics/b9.png',
                                streaks: 27,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 160,
                            child: Column(
                              children: [
                                Container(
                                  height: 120,
                                  // child: ,
                                  decoration: BoxDecoration(
                                      // color: Colors.grey.withOpacity(.2),
                                      // borderRadius: BorderRadius.circular(10)

                                      ),
                                  // child: Image.asset(img , fit: BoxFit.cover,),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  '',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.fSize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Visibility(
                          visible: controller.streaks >= 30,
                          child: _buildRewardCard(
                              'assets/badgesPics/b10.png', 'Black Belt', () {
                            Get.to(
                              RewardInfoScreen(
                                img: 'assets/badgesPics/b10.png',
                                streaks: 30,
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            child: Column(
                              children: [
                                Container(
                                  height: 120,
                                  // child: ,
                                  decoration: BoxDecoration(
                                      // color: Colors.grey.withOpacity(.2),
                                      // borderRadius: BorderRadius.circular(10)

                                      ),
                                  // child: Image.asset(img , fit: BoxFit.cover,),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  '',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.fSize,
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
              );
            }
          }),
        )

        // body: Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: CustomImageView(
        //     onTap: () {
        //       Get.toNamed(AppRoutes.rewardInfoScreen);
        //     },
        //     imagePath: ImageConstant.imgImage15,
        //     height: 699.v,
        //     width: 390.h,
        //   ),
        // ),
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
