import '../controller/my_badges_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RewardDesigntwoScreen.
///
/// This class ensures that the RewardDesigntwoController is created when the
/// RewardDesigntwoScreen is first loaded.
class MyBadgesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyBadgesController());
  }
}
