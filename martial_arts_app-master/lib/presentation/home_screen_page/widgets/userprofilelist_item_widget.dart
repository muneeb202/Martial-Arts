import '../../../core/app_export.dart';
import '../controller/home_screen_controller.dart';
import '../models/userprofilelist_item_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofilelistItemWidget extends StatelessWidget {
  UserprofilelistItemWidget(
    this.userprofilelistItemModelObj, {
    Key? key,
  }) : super(key: key);

  UserprofilelistItemModel userprofilelistItemModelObj;

  var controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 168.h,
      child: Card(
        color: userprofilelistItemModelObj.color!.value,
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        shadowColor: Colors.grey,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Container(
          height: 96.v,
          width: 168.h,
          // padding: EdgeInsets.symmetric(vertical: 8.v),
          decoration: AppDecoration.fillSecondaryContainer.copyWith(
            color: userprofilelistItemModelObj.color!.value,
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        // height: 60.v,
                        // width: 50.h,
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(bottom: 23.v),
                        // padding: EdgeInsets.symmetric(
                        //   horizontal: 15.h,
                        //   vertical: 11.v,
                        // ),
                        decoration: AppDecoration.fillOrange.copyWith(
                          color: userprofilelistItemModelObj.color1!.value,
                          borderRadius: BorderRadiusStyle.circleBorder7,
                        ),
                        child: Obx(
                          () => CustomImageView(
                            imagePath:
                                userprofilelistItemModelObj.streaksImage!.value,
                            // height: 27.v,
                            // width: 25.h,
                            alignment: Alignment.center,
                            color: appTheme.whiteA700,
                          ),
                        ),
                      ),
                      // Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              userprofilelistItemModelObj.streaksText!.value,
                              style: CustomTextStyles
                                  .titleMediumManropeWhiteA700,
                            ),
                          ),
                          Obx(
                            () => Text(
                              userprofilelistItemModelObj
                                  .fiveHundredText!.value,
                              style: theme.textTheme.headlineSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Obx(
                () => CustomImageView(
                  imagePath: userprofilelistItemModelObj.streaksImage1!.value,
                  height: 60.v,
                  width: 167.h,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 1.v),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
