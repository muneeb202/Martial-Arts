import '/core/app_export.dart';
import '/presentation/daily_reward_screen/models/daily_reward_model.dart';

/// A controller class for the DailyRewardScreen.
///
/// This class manages the state of the DailyRewardScreen, including the
/// current dailyRewardModelObj
class DailyRewardController extends GetxController {
  Rx<DailyRewardModel> dailyRewardModelObj = DailyRewardModel().obs;
}
