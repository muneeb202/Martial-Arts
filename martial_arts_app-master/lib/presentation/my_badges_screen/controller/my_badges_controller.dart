import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '/presentation/my_badges_screen/models/my_badges_model.dart';
import '../../../services/ApiService.dart';

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
    try {
      final fetchedStreaks = await ApiService.fetchStreaks();
      streaks.value = fetchedStreaks[0]["streaks"];
    } catch (e) {}
  }
}
