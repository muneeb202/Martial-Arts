import 'package:martial_art/presentation/my_badges_screen/my_badges_screen.dart';

import '../../../core/app_export.dart';

/// This class is used in the [viewhierarchysection_item_widget] screen.
class ViewhierarchysectionItemModel {
  ViewhierarchysectionItemModel({
    this.dailyRewardBadges,
    this.dailyBadgesOn,
    this.id,
    this.onPressed,
  }) {
    dailyRewardBadges = dailyRewardBadges ?? Rx("Daily Reward/Badges");
    dailyBadgesOn = dailyBadgesOn ??
        Rx("Daily badges on maintaining streaks.Maintain streak for high level badges and monthly rewards");
    id = id ?? Rx("");
    onPressed = onPressed ??
        () {
          // Get.to(MyBadgesScreen());
        };
  }

  Rx<String>? dailyRewardBadges;

  Rx<String>? dailyBadgesOn;

  Rx<String>? id;

  void Function()? onPressed;
}
