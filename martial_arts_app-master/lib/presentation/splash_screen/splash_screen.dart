import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/splash_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends GetWidget<SplashController> {
  SplashScreen({Key? key}) : super(key: key);
  final List sliderImg = [
    'assets/images/pic_9.png',
    'assets/images/pic_10.png',
    'assets/images/pic_11.png'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildSlider(),
                  SizedBox(height: 20.v),
                  SizedBox(
                      width: 254.h,
                      child: Text("msg_create_your_healthy".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: appTheme.blueGray900,
                              fontSize: 22.fSize,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700))),
                  SizedBox(height: 30.v),
                  Container(
                      width: 292.h,
                      margin: EdgeInsets.only(left: 52.h, right: 49.h),
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "msg_join_the_app_to2".tr,
                                style: GoogleFonts.poppins(
                                  color:
                                      appTheme.deepOrange50001.withOpacity(0.7),
                                )),
                            TextSpan(
                                text: "lbl_martial_art".tr,
                                style: GoogleFonts.montserrat(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16)),
                            TextSpan(
                                text: "msg_routine_with_daily".tr,
                                style: GoogleFonts.poppins(
                                  color:
                                      appTheme.deepOrange50001.withOpacity(0.7),
                                ))
                          ]),
                          textAlign: TextAlign.center)),
                  SizedBox(height: 85.v),
                  CustomElevatedButton(
                    width: Get.width / 1.3,
                    text: "lbl_register".tr,
                    // text: "lbl_login".tr,
                    onPressed: () {
                      Get.toNamed(
                        AppRoutes.registerTabContainerScreen,
                        arguments: {"initialTabIndex": 1},
                      );
                    },
                    buttonTextStyle: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 15),
                    buttonStyle: CustomButtonStyles.outlinePrimary,
                  ),
                  SizedBox(height: 24.v),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     // Divider(color: Colors.black,height: 10,),
                  //     // Text("OR"),
                  //     Divider(color: Colors.black,height: 10,),
                  //   ],
                  // ),
                  // SizedBox(height: 12.v),

                  CustomElevatedButton(
                      width: Get.width / 1.3,
                      text: "lbl_login".tr,
                      onPressed: () {
                        Get.toNamed(
                          AppRoutes.registerTabContainerScreen,
                        );
                      },
                      buttonTextStyle: GoogleFonts.montserrat(fontSize: 15.0),
                      buttonStyle: CustomButtonStyles.none,
                      decoration:
                          CustomButtonStyles.gradientWhiteAToWhiteADecoration),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  Widget _buildSlider() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 23.v),
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),

        // decoration: AppDecoration.outlinePrimary
        //     .copyWith(borderRadius: BorderRadiusStyle.customBorderBL34),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CarouselSlider(
              items: sliderImg.map((e) {
                return SizedBox(
                  height: 314,
                  width: 381,
                  child: Image.asset(e),
                );
              }).toList(),
              options: CarouselOptions(
                height: 314,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  controller.sliderIndex.value = index;
                },
              )),
          SizedBox(height: 28.v),
          Obx(() => SizedBox(
              height: 10.v,
              child: AnimatedSmoothIndicator(
                  activeIndex: controller.sliderIndex.value,
                  count: sliderImg.length,
                  axisDirection: Axis.horizontal,
                  effect: ScrollingDotsEffect(
                      spacing: 10,
                      activeDotColor: Colors.deepOrange,
                      dotColor: Colors.grey.withOpacity(0.5),

                      // activeDotColor: appTheme.whiteA700,
                      // dotColor: appTheme.blueGray1004c,
                      dotHeight: 7.v,
                      dotWidth: 7.h))))
        ]));
  }
}
