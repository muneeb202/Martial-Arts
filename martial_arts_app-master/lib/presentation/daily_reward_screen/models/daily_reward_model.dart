import '../../../core/app_export.dart';
import 'viewhierarchysection_item_model.dart';

/// This class defines the variables used in the [daily_reward_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DailyRewardModel {
  Rx<List<ViewhierarchysectionItemModel>> viewhierarchysectionItemList = Rx([
    ViewhierarchysectionItemModel(
      dailyRewardBadges: "Daily Reward/Badges".obs,
      dailyBadgesOn:
          "Daily badges on maintaining streaks.Maintain streak for high level badges and monthly rewards"
              .obs,
      onPressed: () {
        Get.toNamed(AppRoutes.myBadgesScreen);
      },
    ),
    ViewhierarchysectionItemModel(
      dailyRewardBadges: "Monthly Prizes".obs,
      dailyBadgesOn:
          "Based on your badges, you will be presented rewards at the end of month, higher the badge, higher the reward"
              .obs,
      onPressed: () {
        Get.toNamed(AppRoutes.badgesDetailScreen);
      },
    )
  ]);
}
