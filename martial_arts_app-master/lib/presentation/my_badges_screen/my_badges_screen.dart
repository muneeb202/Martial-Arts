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

  Widget _buildRewardCard(String img , String games , VoidCallback onTap) {
    return
      Expanded(child: InkWell(
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
                    borderRadius: BorderRadius.circular(10)

                ),
                child: Image.asset(img , fit: BoxFit.cover,),
              ),
              SizedBox(
                height: 12,
              ),
              Text(games,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                // color: Colors.black,
                fontSize: 12.fSize,
              ),),


            ],
          ),
        ),
      ),);

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: _buildAppBar(),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _buildRewardCard('assets/badgesPics/b1.png', 'White Belt' , () {
                      Get.to(RewardInfoScreen(img: 'assets/badgesPics/b1.png'),);

                    }),
                    SizedBox(
                      width: 10,
                    ),
                    _buildRewardCard('assets/badgesPics/b2.png', 'Orange Belt', () {
                      Get.to(RewardInfoScreen(img: 'assets/badgesPics/b1.png'),);

                    }),
                    SizedBox(
                      width: 10,
                    ),_buildRewardCard('assets/badgesPics/b3.png', 'Red Belt', () {
                      Get.to(RewardInfoScreen(img: 'assets/badgesPics/b1.png'),);

                    }),


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
                    _buildRewardCard('assets/badgesPics/b4.png', 'Yellow Belt' , () {
                      Get.to(RewardInfoScreen(img: 'assets/badgesPics/b1.png'),);

                    }),
                    SizedBox(
                      width: 10,
                    ),
                    _buildRewardCard('assets/badgesPics/b5.png', 'Green Belt', () {
                      Get.to(RewardInfoScreen(img: 'assets/badgesPics/b1.png'),);

                    }),
                    SizedBox(
                      width: 10,
                    ),_buildRewardCard('assets/badgesPics/b6.png', 'Purple Belt', () {
                      Get.to(RewardInfoScreen(img: 'assets/badgesPics/b1.png'),);

                    }),


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
                    _buildRewardCard('assets/badgesPics/b7.png', 'Purple/White Belt' , () {
                      Get.to(RewardInfoScreen(img: 'assets/badgesPics/b1.png'),);

                    }),
                    SizedBox(
                      width: 10,
                    ),
                    _buildRewardCard('assets/badgesPics/b8.png', 'Brown Belt', () {
                      Get.to(RewardInfoScreen(img: 'assets/badgesPics/b1.png'),);

                    }),
                    SizedBox(
                      width: 10,
                    ),_buildRewardCard('assets/badgesPics/b9.png', 'Brown/White', () {
                      Get.to(RewardInfoScreen(img: 'assets/badgesPics/b1.png'),);

                    }),


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
                    Expanded(child: Container(
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
                          Text('', style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.fSize,
                          ),),


                        ],
                      ),
                    ),),
                    SizedBox(
                      width: 10,
                    ),
                    _buildRewardCard('assets/badgesPics/b10.png', 'Black Belt', () {
                      Get.to(RewardInfoScreen(img: 'assets/badgesPics/b1.png'),);

                    }),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Container(
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
                          Text('', style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.fSize,
                          ),),


                        ],
                      ),
                    ),),



                  ],
                ),
              ),
            ],
          ),
        ),

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
