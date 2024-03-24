import 'dart:convert';
import 'dart:io';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:martial_art/presentation/win_tracker_page/models/win_tracker_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the WinTrackerPage.
///
/// This class manages the state of the WinTrackerPage, including the
/// current winTrackerModelObjs
class WinTrackerController extends GetxController {
  WinTrackerController(this.winTrackerModelObj);
  final RxString username = RxString('');
  File? profilepic = null;

  Rx<WinTrackerModel> winTrackerModelObj;

  @override
  void onInit() {
    super.onInit();
    _getUsername();
    getProfilePic();
  }

  Future<void> getProfilePic() async {
    String path = Directory.systemTemp.path + '/profile_picture.jpg';
    if (await File(path).exists()) profilepic = File(path);
  }

  Future<void> _getUsername() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    String encodedUser = user.getString('user') ?? "";
    Map userDict = jsonDecode(encodedUser);
    username.value = userDict['fullname'].split(' ')[0];
    update();
  }

  void updateModel() {
    winTrackerModelObj.value.getCompletedActivities();
  }
}
