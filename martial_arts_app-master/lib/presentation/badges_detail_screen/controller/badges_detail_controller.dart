import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '/presentation/badges_detail_screen/models/badges_detail_model.dart';

/// A controller class for the RewardDesignoneScreen.
///
/// This class manages the state of the RewardDesignoneScreen, including the
/// current rewardDesignoneModelObj
class BadgesDetailController extends GetxController {
  Rx<BadgesDetailModel> rewardDesignoneModelObj = BadgesDetailModel().obs;
}
