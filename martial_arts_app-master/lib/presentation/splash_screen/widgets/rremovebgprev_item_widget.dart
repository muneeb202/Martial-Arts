import '../controller/splash_controller.dart';
import '../models/rremovebgprev_item_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';

// ignore: must_be_immutable
class RremovebgprevItemWidget extends StatelessWidget {
  RremovebgprevItemWidget(
    this.rremovebgprevItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RremovebgprevItemModel rremovebgprevItemModelObj;

  var controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 314.v,
      width: 381.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.pic9,
            height: 314.v,
            width: 381.h,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 19.v),
              child: SizedBox(
                width: 308.h,
                child: Divider(
                  color: appTheme.black900.withOpacity(0.25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
