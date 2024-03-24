import 'dart:io';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:martial_art/presentation/progress_page/models/progress_model.dart';

/// A controller class for the ProgressPage.
///
/// This class manages the state of the ProgressPage, including the
/// current progressModelObj
class ProgressController extends GetxController {
  ProgressController(this.progressModelObj);
  File? profilepic = null;

  Rx<ProgressModel> progressModelObj;

  @override
  void onInit() {
    super.onInit();
    getProfilePic();
  }

  Future<void> getProfilePic() async {
    String path = Directory.systemTemp.path + '/profile_picture.jpg';
    if (await File(path).exists()) profilepic = File(path);
  }
}
