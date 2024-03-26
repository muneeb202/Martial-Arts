import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '/presentation/reward_info_screen/models/reward_info_model.dart';

/// A controller class for the RewardInfoScreen.
///
/// This class manages the state of the RewardInfoScreen, including the
/// current rewardInfoModelObj
class RewardInfoController extends GetxController {
  Rx<RewardInfoModel> rewardInfoModelObj = RewardInfoModel().obs;
}
