import 'dart:developer';
import 'dart:io';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home_screen_page/widgets/studentactivitieslist_item_widget.dart';
import '../home_screen_page/widgets/userprofile_item_widget.dart';
import 'controller/home_screen_controller.dart';
import 'models/home_screen_model.dart';
import 'models/studentactivitieslist_item_model.dart';
import 'models/userprofile_item_model.dart';
import 'models/userprofilelist_item_model.dart';
import '/core/app_export.dart';
import '/widgets/app_bar/appbar_subtitle.dart';
import '/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({Key? key}) : super(key: key);

  HomeScreenController controller =
      Get.put(HomeScreenController(HomeScreenModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            _buildBackgroundImages(),
            Animate(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Animate(
                      child: _buildProfile(),
                    ).slideX(curve: Curves.easeIn),
                    // Animate(child: _buildMainView())
                    //     .slideX(curve: Curves.easeIn),
                    Animate(
                      child: secondWidget(context),
                    ).slideX(curve: Curves.easeIn),
                    // Animate(
                    //   child: _buildUserProfileList1(),
                    // ).slideY().fadeIn(),
                    Animate(
                      child: _buildUserProfileList2(),
                    ).scale(),
                    _buildStudentActivitiesTitle(),
                    Animate(
                      child: _buildStudentActivitiesList(),
                    ).scaleY(),
                  ],
                ),
              ),
            ).fadeIn(),
          ],
        ),
      ),
    );
  }

  Widget secondWidget(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      return Padding(
        // padding: EdgeInsets.fromLTRB(24.h, 20.v, 20.h, 12.v),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            keepThisGoingWidget(context, controller),
            // SizedBox(width: 10,),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 6.2,
                    width: MediaQuery.of(context).size.width / 3,
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      // boxShadow: [
                      //
                      //   BoxShadow(
                      //
                      //     color: Colors.black.withOpacity(0.1),
                      //     spreadRadius: 1,
                      //     blurRadius: 3,
                      //     offset: Offset(1, 1), // This defines the shadow position, adjust as needed
                      //   ),
                      // ],

                      color: appTheme.deepOrange500,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 12.fSize, left: 2.fSize),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    ImageConstant.imgGroup8,
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          "Streaks",
                                          style: TextStyle(
                                            fontSize: 18.fSize,
                                            color: Colors.white,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          controller.streaks.value,
                                          style: TextStyle(
                                              fontSize: 18.fSize,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // Image(image: AssetImage(AssetImage),),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(ImageConstant.imgGroup5),
                        ),
                      ],
                    ),
                  ),
                  // Spacer(),
                  Container(
                    height: MediaQuery.of(context).size.height / 6.2,
                    width: MediaQuery.of(context).size.width / 3,
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      color: appTheme.deepPurple500,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 12.fSize, left: 2.fSize),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    ImageConstant.imgFrame,
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Points",
                                        style: TextStyle(
                                          fontSize: 18.fSize,
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        controller.points.value,
                                        style: TextStyle(
                                            fontSize: 18.fSize,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // Image(image: AssetImage(AssetImage),),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(ImageConstant.imgGroup7),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget keepThisGoingWidget(
      BuildContext context, HomeScreenController controller) {
    // final mq = mq;
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: theme.colorScheme.primary,
        // boxShadow: [
        //
        //   BoxShadow(
        //
        //     color: Colors.black.withOpacity(0.1),
        //     spreadRadius: 1,
        //     blurRadius: 3,
        //     offset: Offset(1, 1), // This defines the shadow position, adjust as needed
        //   ),
        // ]
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              ImageConstant.imgScreenshot2023,
              height: MediaQuery.of(context).size.height / 6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Keep this going!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.fSize,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Streaks',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        controller.month_streaks.value +
                            '/' +
                            controller.total_days.value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                      LinearProgressIndicator(
                        color: appTheme.whiteA700,
                        backgroundColor: appTheme.deepOrange200,
                        value: int.parse(controller.month_streaks.value) /
                            int.parse(controller.total_days.value),
                      ),
                    ],
                  ),
                ),
                // Divider(color: Colors.white.withOpacity(0.5),),
                // Text('36 Days of streaks done and its counting...!',
                //   textAlign: TextAlign.start,
                //   style: TextStyle(
                //     fontWeight: FontWeight.w500,
                //     fontFamily: 'Montserrat',
                //     fontSize: 18,
                //     color: Colors.white,
                //   ),
                // ),
                // Spacer(),
              ],
            ),
          ),
        ],
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
          CustomImageView(
            imagePath: ImageConstant.imgEllipse186,
            height: 537.v,
            width: 153.h,
            alignment: Alignment.topRight,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: CustomImageView(
              imagePath: ImageConstant.imgEllipse186426x119,
              height: 426.v,
              width: 119.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 1.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getCurrentDate(),
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: appTheme.gray700,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_hello".tr,
                            style: GoogleFonts.poppins(
                              color: Color(0XFF6A6767),
                              fontSize: 23.fSize,
                            ),
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: controller.username.value,
                            style: GoogleFonts.montserrat(
                              color: Color(0XFF2E2E2E),
                              fontSize: 23.fSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: "lbl".tr,
                            style: CustomTextStyles
                                .titleLargeNunitoff2e2e2eRegular,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();
                  final XFile? pickedImage = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );

                  if (pickedImage != null) {
                    log('Image selected: ${pickedImage.path}');
                    controller.setSelectedImage(pickedImage.path);
                  } else {
                    log('Image picker was closed or canceled');
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: theme.colorScheme.primary, width: 3),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    // Check if the selected image path is available
                    child: controller.profilepic != null
                        ? ClipOval(
                            child: Image.file(
                              controller.profilepic!,
                              fit: BoxFit.cover,
                              width: 42.adaptSize,
                              height: 42.adaptSize,
                            ),
                          )
                        : Icon(
                            Icons.person_outline,
                            color: theme.colorScheme.primary,
                            size: 42.adaptSize,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildMainView() {
    return Align(
      alignment: Alignment.topCenter,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.orange,
        // Set shadow color
        elevation: 10,
        // margin: EdgeInsets.only(top: 119.v),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Container(
          height: 142.v,
          width: 358.h,
          decoration: AppDecoration.outlineBlack.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 142.v,
                  width: 357.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(20.h),
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgRectangle39,
                height: 40.v,
                width: 350.h,
                radius: BorderRadius.circular(20.h),
                alignment: Alignment.centerRight,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgRectangle39,
                height: 110.v,
                width: 270.h,
                radius: BorderRadius.circular(40.h),
                alignment: Alignment.centerRight,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 13.v,
                    left: 20,
                  ),
                  child: SizedBox(
                    width: 200.h,
                    child: LinearProgressIndicator(
                      color: appTheme.whiteA700,
                      backgroundColor: appTheme.deepOrange200,
                      value: 16 / 30,
                    ),
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgScreenshot2023,
                height: 122.v,
                width: 148.h,
                radius: BorderRadius.circular(
                  15.h,
                ),
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(right: 1.h),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 22.h, right: 162.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "msg_keep_this_going".tr,
                        style: GoogleFonts.montserrat(
                          color: appTheme.whiteA700,
                          fontSize: 19.fSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 1.v),
                      SizedBox(
                        width: 173.h,
                        child: Text(
                          "msg_36_days_of_streaks".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              // color: appTheme.gray700,
                              color: Colors.white,
                              fontSize: 14.fSize,
                              fontWeight: FontWeight.w500,
                              height: 1.42),
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Padding(
                        padding: EdgeInsets.only(right: 27.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "lbl_my_streaks".tr,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.fSize,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 17.v,
                              width: 44.h,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgVector12,
                                    height: 3.v,
                                    width: 9.h,
                                    radius: BorderRadius.circular(2.h),
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(left: 14.h),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: 44.h,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.h,
                                        vertical: 1.v,
                                      ),
                                      decoration:
                                          AppDecoration.fillWhiteA.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder7,
                                      ),
                                      child: Text(
                                        "lbl_16_30".tr,
                                        style: GoogleFonts.poppins(
                                            fontSize: 10.fSize,
                                            color: theme.colorScheme.primary,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.v),
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

  Widget _buildUserProfileList1() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(
        height: 96.v,
        child: Obx(
          () => ListView.separated(
            padding: EdgeInsets.only(left: 20.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 15.h,
              );
            },
            itemCount: controller
                .homeScreenModelObj.value.userprofilelistItemList.value.length,
            itemBuilder: (context, index) {
              UserprofilelistItemModel model = controller.homeScreenModelObj
                  .value.userprofilelistItemList.value[index];
              // return UserprofilelistItemWidget(
              //   model,
              // );
              return UserprofileItemWidget(model);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfileList2() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: 25.h,
          left: 14.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14.h),
              child: Text(
                "msg_this_month_june".tr,
                style: GoogleFonts.montserrat(
                  color: appTheme.blueGray700,
                  fontSize: 21.fSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5.v),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: SizedBox(
                height: 96.v,
                child: Obx(
                  () => ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return SizedBox(
                        width: 15.h,
                      );
                    },
                    itemCount: controller.homeScreenModelObj.value
                        .userprofileItemList.value.length,
                    itemBuilder: (context, index) {
                      UserprofileItemModel model = controller.homeScreenModelObj
                          .value.userprofileItemList.value[index];
                      return UserprofileItemWidget(
                        model,
                      );
                    },
                  ),
                ),
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
        top: 22.h,
        // bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 14.h),
            child: Text(
              "msg_student_activities".tr,
              style: GoogleFonts.montserrat(
                color: appTheme.blueGray700,
                fontSize: 21.fSize,
                // fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
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
          //     style: TextStyle(
          //       color: theme.colorScheme.primary,
          //       fontSize: 11.fSize,
          //       fontFamily: 'Nunito',
          //       fontWeight: FontWeight.w700,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  // padding: EdgeInsets.only(
  // left: 13.h,
  // right: 23.h,
  // top: 12.v,
  // bottom: 40.v,
  // ),
  Widget _buildStudentActivitiesList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Obx(
        () => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 4.v,
            );
          },
          itemCount: controller.homeScreenModelObj.value
              .studentactivitieslistItemList.value.length,
          itemBuilder: (context, index) {
            StudentactivitieslistItemModel model = controller.homeScreenModelObj
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
