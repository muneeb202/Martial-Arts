import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '/presentation/daily_reward_screen/models/daily_reward_model.dart';

/// A controller class for the DailyRewardScreen.
///
/// This class manages the state of the DailyRewardScreen, including the
/// current dailyRewardModelObj
class DailyRewardController extends GetxController {
  Rx<DailyRewardModel> dailyRewardModelObj = DailyRewardModel().obs;
}
