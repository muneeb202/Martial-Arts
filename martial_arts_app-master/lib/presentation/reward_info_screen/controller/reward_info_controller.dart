import '/core/app_export.dart';
import '/presentation/reward_info_screen/models/reward_info_model.dart';

/// A controller class for the RewardInfoScreen.
///
/// This class manages the state of the RewardInfoScreen, including the
/// current rewardInfoModelObj
class RewardInfoController extends GetxController {
  Rx<RewardInfoModel> rewardInfoModelObj = RewardInfoModel().obs;
}
