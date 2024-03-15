import 'package:flutter/material.dart';
import 'package:martial_art/presentation/daily_reward_screen/models/viewhierarchysection_item_model.dart';

import '/core/app_export.dart';
import '/presentation/my_badges_screen/models/my_badges_model.dart';
import '../../../services/ApiService.dart';
import 'dart:developer';

/// A controller class for the RewardDesigntwoScreen.
///
/// This class manages the state of the RewardDesigntwoScreen, including the
/// current rewardDesigntwoModelObj
class MyBadgesController extends GetxController {
  Rx<MyBadgesModel> rewardDesigntwoModelObj = MyBadgesModel().obs;
  RxInt streaks = RxInt(-1);

  @override
  void onInit() {
    super.onInit();
    fetchStreaks();
  }

  void fetchStreaks() async {
    log('in the fetchstreaks');
    try {
      final fetchedStreaks = await ApiService.fetchStreaks();
      streaks.value = fetchedStreaks[0]["streaks"];
    } catch (e) {
      log('Error fetching streaks: $e');
    }
  }
}
