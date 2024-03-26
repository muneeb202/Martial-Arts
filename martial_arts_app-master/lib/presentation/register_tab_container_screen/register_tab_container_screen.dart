
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/register_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/login_page/login_page.dart';
import 'package:martial_art/presentation/register_page/register_page.dart';
import 'package:martial_art/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:martial_art/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class RegisterTabContainerScreen extends StatefulWidget {
  const RegisterTabContainerScreen({Key? key}) : super(key: key);

  @override
  State<RegisterTabContainerScreen> createState() =>
      _RegisterTabContainerScreenState();
}

class _RegisterTabContainerScreenState
    extends State<RegisterTabContainerScreen> {
  final controller =
      Get.put<RegisterTabContainerController>(RegisterTabContainerController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return SafeArea(
      child: Scaffold(
        //backgroundColor: appTheme.whiteA700,
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        //   leading: IconButton(
        //       style: ButtonStyle(
        //         side: MaterialStatePropertyAll(
        //             BorderSide(color: appTheme.redA200)),
        //       ),
        //       onPressed: () {
        //         Get.back();
        //       },
        //       icon: Icon(
        //         Icons.arrow_back,
        //         color: Colors.white,
        //       )),
        // ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: 844.v,
            width: double.infinity,
            child: Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                _buildHeaderBackground(),
                Positioned(
                  // top: 170.0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          //borderRadius: BorderRadiusStyle.customBorderTL40,
                          //color: Colors.amber,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 15.0,
                          ),
                          _buildTabview(),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 552.v,
                            child: TabBarView(
                              controller: controller.tabviewController,
                              children: [
                                LoginPage(),
                                RegisterPage(),
                              ],
                            ),
                          ),
                        ],
                      ),
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
  Widget _buildHeaderBackground() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 374.v,
        width: double.infinity,
        decoration: AppDecoration.fillPrimary,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Opacity(
              opacity: 0.5,
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse1374x350,
                height: 374.v,
                width: 350.h,
                alignment: Alignment.centerLeft,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 340.v,
                width: 246.h,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgEllipse2340x246,
                        height: 340.v,
                        width: 246.h,
                        alignment: Alignment.center,
                      ),
                    ),
                    CustomAppBar(
                      height: 88.v,
                      leadingWidth: 390.h,
                      leading: AppbarLeadingIconbutton(
                        imagePath: ImageConstant.imgFi2223615,
                        margin: EdgeInsets.only(
                          left: 24.h,
                          right: 334.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24.h,
                  top: 40.v,
                  right: 81.h,
                ),
                child:
                    GetBuilder<RegisterTabContainerController>(builder: (ctrl) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ctrl.tabviewController.index == 0
                            ? "msg_create_your_account".tr
                            : "msg_create_account".tr,
                        style: TextStyle(
                          color: appTheme.whiteA700,
                          fontSize: 24.fSize,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Text(
                        "msg_sign_in_up_to_enjoy".tr,
                        style: TextStyle(
                          color: appTheme.whiteA700,
                          fontSize: 12.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview() {
    return Container(
      height: 52.v,
      width: 342.h,
      decoration: BoxDecoration(
        color: appTheme.orange50,
        borderRadius: BorderRadius.circular(
          26.h,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.06),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
      ),
      child: TabBar(
        controller: controller.tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.orangeA200,
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelColor: appTheme.blueGray500,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Montserrat',
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
              offset: Offset(
                0,
                1,
              ),
            ),
          ],
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl_login".tr,
              style: GoogleFonts.montserrat(),
            ),
          ),
          Tab(
            child: Text(
              "lbl_register2".tr,
              style: GoogleFonts.montserrat(),
            ),
          ),
        ],
      ),
    );
  }
}
