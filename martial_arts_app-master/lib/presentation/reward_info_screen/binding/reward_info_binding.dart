import '../controller/reward_info_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RewardInfoScreen.
///
/// This class ensures that the RewardInfoController is created when the
/// RewardInfoScreen is first loaded.
class RewardInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RewardInfoController());
  }
}
