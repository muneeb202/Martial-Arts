import '../controller/daily_reward_controller.dart';
import '../models/viewhierarchysection_item_model.dart';
import '/core/app_export.dart';
import '/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewhierarchysectionItemWidget extends StatelessWidget {
  ViewhierarchysectionItemWidget(
    this.viewhierarchysectionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ViewhierarchysectionItemModel viewhierarchysectionItemModelObj;

  var controller = Get.find<DailyRewardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 16.v,
      ),
      // decoration: AppDecoration.outlineDeepOrange.copyWith(
      //   borderRadius: BorderRadiusStyle.circleBorder10,
      // ),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.grey.withOpacity(.5),
          ),
          right: BorderSide(color: Colors.grey.withOpacity(.5),
          ),
          bottom: BorderSide(color: Colors.grey.withOpacity(.5),
          ),

        ),

        borderRadius: BorderRadius.circular(20),
              ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 6.v),
          Obx(
            () => Text(
              viewhierarchysectionItemModelObj.dailyRewardBadges!.value,
              style: CustomTextStyles.titleSmallNotoSansGray700,
            ),
          ),
          SizedBox(height: 6.v),
          SizedBox(
            width: 278.h,
            child: Obx(
              () => Text(
                viewhierarchysectionItemModelObj.dailyBadgesOn!.value,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyMedium13,
              ),
            ),
          ),
          SizedBox(height: 9.v),
          CustomElevatedButton(
            height: 30.v,
            width: 80.h,
            text: "lbl_check".tr,
            buttonTextStyle: TextStyle(color: appTheme.whiteA700),
            buttonStyle: CustomButtonStyles.outlineBlack,
            onPressed: viewhierarchysectionItemModelObj.onPressed,
          ),
        ],
      ),
    );
  }
}
