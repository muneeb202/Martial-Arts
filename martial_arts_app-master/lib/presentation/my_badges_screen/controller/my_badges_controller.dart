import '/core/app_export.dart';
import '/presentation/my_badges_screen/models/my_badges_model.dart';

/// A controller class for the RewardDesigntwoScreen.
///
/// This class manages the state of the RewardDesigntwoScreen, including the
/// current rewardDesigntwoModelObj
class MyBadgesController extends GetxController {
  Rx<MyBadgesModel> rewardDesigntwoModelObj = MyBadgesModel().obs;
}
