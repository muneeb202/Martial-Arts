import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/win_tracker_page/models/win_tracker_model.dart';
import 'package:martial_art/services/ApiService.dart';
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
    String path = Directory.systemTemp.path;
    profilepic = File('$path/profile_picture.jpg');
  }

  Future<void> _getUsername() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    String encodedUser = user.getString('user') ?? "";
    Map userDict = jsonDecode(encodedUser);
    username.value = userDict['username'];
    update();
  }

  void updateModel() {
    winTrackerModelObj.value.getCompletedActivities();
  }
}
