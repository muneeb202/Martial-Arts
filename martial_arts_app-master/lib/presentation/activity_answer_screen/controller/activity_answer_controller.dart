import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/activity_answer_screen/models/activity_answer_model.dart';

/// A controller class for the ActivityAnswerScreen.
///
/// This class manages the state of the ActivityAnswerScreen, including the
/// current activityAnswerModelObj
class ActivityAnswerController extends GetxController {
  Rx<ActivityAnswerModel> activityAnswerModelObj = ActivityAnswerModel().obs;
}
