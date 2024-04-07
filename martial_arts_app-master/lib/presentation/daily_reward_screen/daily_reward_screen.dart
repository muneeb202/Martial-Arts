import 'package:flutter_animate/flutter_animate.dart';
import 'package:martial_art/presentation/daily_reward_screen/controller/daily_reward_controller.dart';
import '../daily_reward_screen/widgets/viewhierarchysection_item_widget.dart';
import 'models/viewhierarchysection_item_model.dart';
import '/core/app_export.dart';
import 'package:flutter/material.dart';

class DailyRewardScreen extends StatelessWidget {
  DailyRewardScreen({Key? key}) : super(key: key);
  final ctrl = Get.put<DailyRewardController>(DailyRewardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Animate(child: _buildRewardSection()).fadeIn(),
              SizedBox(height: 32.v),
              Animate(child: _buildViewHierarchySection()).flipH(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRewardSection() {
    return Container(
      height: 205.v,
      width: double.infinity,
      color: appTheme.orange900,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "lbl_reward".tr,
                    style: theme.textTheme.headlineMedium,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 5.v,
                  ),
                  Text(
                    "msg_check_in_everyday".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleSmallNunitoWhiteA700,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Animate(
              child: CustomImageView(
                imagePath: ImageConstant.imgGift,
                height: 128.v,
                width: 130.h,
              ),
            ).moveY(),
          ],
        ),
      ),
    );
  }

  Widget _buildViewHierarchySection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: Obx(
        () => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 31.v,
            );
          },
          itemCount: ctrl.dailyRewardModelObj.value.viewhierarchysectionItemList
              .value.length,
          itemBuilder: (context, index) {
            ViewhierarchysectionItemModel model = ctrl.dailyRewardModelObj.value
                .viewhierarchysectionItemList.value[index];
            return ViewhierarchysectionItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
