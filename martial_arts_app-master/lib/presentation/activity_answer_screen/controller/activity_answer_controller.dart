import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:martial_art/presentation/activity_answer_screen/models/activity_answer_model.dart';

/// A controller class for the ActivityAnswerScreen.
///
/// This class manages the state of the ActivityAnswerScreen, including the
/// current activityAnswerModelObj
class ActivityAnswerController extends GetxController {
  Rx<ActivityAnswerModel> activityAnswerModelObj = ActivityAnswerModel().obs;
}
