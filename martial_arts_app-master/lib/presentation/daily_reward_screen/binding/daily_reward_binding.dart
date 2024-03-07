import '../controller/daily_reward_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DailyRewardScreen.
///
/// This class ensures that the DailyRewardController is created when the
/// DailyRewardScreen is first loaded.
class DailyRewardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DailyRewardController());
  }
}
