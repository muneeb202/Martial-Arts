import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/win_tracker_page/models/win_tracker_model.dart';

/// A controller class for the WinTrackerPage.
///
/// This class manages the state of the WinTrackerPage, including the
/// current winTrackerModelObj
class WinTrackerController extends GetxController {
  WinTrackerController(this.winTrackerModelObj);

  Rx<WinTrackerModel> winTrackerModelObj;
}
