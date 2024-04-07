import 'package:google_fonts/google_fonts.dart';

import '../controller/home_screen_controller.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(this.userprofileItemModelObj, {Key? key})
      : super(key: key);

  dynamic userprofileItemModelObj;

  var controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 168.h,
      child: Card(

        color: Colors.deepOrange,
        // clipBehavior: Clip.antiAlias,
        elevation: 2,
        shadowColor: Colors.grey,
        // margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          // borderRadius: BorderRadiusStyle.roundedBorder20,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(20),
          )
        ),
        child: Container(
          height: 96.v,
          width: 168.h,
          // padding: EdgeInsets.symmetric(vertical: 8.v),
          decoration: AppDecoration.fillSecondaryContainer1.copyWith(
            color: userprofileItemModelObj.color!.value,
            // borderRadius: BorderRadiusStyle.roundedBorder20,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(20),
              )
          ),
          child: Stack(
            // alignment: Alignment.center,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 2,),
                  Container(
                    height: 52.v,
                    width: 48.h,
                    // margin: EdgeInsets.only(bottom: 23.v),
                    // padding: EdgeInsets.symmetric(
                    //   horizontal: 10.h,
                    //   vertical: 11.v,
                    // ),
                    // decoration: AppDecoration.fillOrange.copyWith(
                    //   color: userprofileItemModelObj.color1!.value,
                    //   borderRadius: BorderRadiusStyle.circleBorder7,
                    // ),
                    // decoration: BoxDecoration(
                    //   color: userprofileItemModelObj.color!.value,
                    // ),

                    child: Obx(
                        // ()=> Image.asset(userprofileItemModelObj.streaksImage!.value),
                      () => CustomImageView(
                        imagePath:
                            userprofileItemModelObj.streaksImage!.value,
                        height: 40.v,
                        width: 40.h,
                        alignment: Alignment.center,
                        color: appTheme.whiteA700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h,top: 3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                              () => Text(
                            userprofileItemModelObj.streaksText!.value,
                            style: GoogleFonts.montserrat(
                              color: appTheme.whiteA700,
                              fontSize: 17.fSize,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                        Obx(
                              () => Text(
                            userprofileItemModelObj.fiveHundredText!.value,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 21.fSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SizedBox(width: 5,),
                  Obx(
                    () => CustomImageView(
                      imagePath: userprofileItemModelObj.streaksImage1!.value,
                      height: 60.v,
                      width: 120.h,
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: 1.v),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
