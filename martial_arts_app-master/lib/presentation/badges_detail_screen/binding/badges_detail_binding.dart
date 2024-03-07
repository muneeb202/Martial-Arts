import '../controller/badges_detail_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RewardDesignoneScreen.
///
/// This class ensures that the RewardDesignoneController is created when the
/// RewardDesignoneScreen is first loaded.
class BadgesDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BadgesDetailController());
  }
}
