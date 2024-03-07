import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/progress_page/models/progress_model.dart';

/// A controller class for the ProgressPage.
///
/// This class manages the state of the ProgressPage, including the
/// current progressModelObj
class ProgressController extends GetxController {
  ProgressController(this.progressModelObj);

  Rx<ProgressModel> progressModelObj;
}
