import '../controller/activity_answer_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ActivityAnswerScreen.
///
/// This class ensures that the ActivityAnswerController is created when the
/// ActivityAnswerScreen is first loaded.
class ActivityAnswerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityAnswerController());
  }
}
