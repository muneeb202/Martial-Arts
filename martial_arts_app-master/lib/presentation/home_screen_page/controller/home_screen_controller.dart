import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:martial_art/services/ApiService.dart';

import '../models/home_screen_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the HomeScreenPage.
///
/// This class manages the state of the HomeScreenPage, including the
/// current homeScreenModelObj
class HomeScreenController extends GetxController {
  final Rx<HomeScreenModel> homeScreenModelObj;
  final RxString username = RxString(''); // Add a reactive string for username
  final RxString streaks = RxString('0');
  final RxString points = RxString('0');
  final RxString month_streaks = RxString('0');
  final RxString total_days = RxString('30');
  final RxInt completed = RxInt(0);
  File? profilepic = null;

  // Function to set the selected image path
  void setSelectedImage(String imagePath) {
    profilepic = File(imagePath);
    ApiService.uploadImage(File(imagePath));
    final tempFile = File('${Directory.systemTemp.path}/profile_picture.jpg');
    File(imagePath).copy(tempFile.path);
    update();
  }

  HomeScreenController(this.homeScreenModelObj);

  @override
  void onInit() {
    super.onInit();
    updateInfo();
    _getProfilePic();
    ever(points, (_) {
      // Update UI whenever username changes
      homeScreenModelObj.value.getStreaksAndPointsFromSharedPrefs();
      HomeScreenController(this.homeScreenModelObj);
      update(); // Trigger rebuild of HomeScreen using GetX update method
    });
  }

  void updatePoints() async {
    completed.value++;
    SharedPreferences user = await SharedPreferences.getInstance();
    String encodedUser = user.getString('user') ?? "";
    Map userDict = jsonDecode(encodedUser);
    if (completed.value == 12) {
      streaks.value = (int.parse(streaks.value) + 1).toString();
      month_streaks.value = (int.parse(month_streaks.value) + 1).toString();
      homeScreenModelObj.value.streaks.value = month_streaks.value;
      userDict['monthlyStreak']++;
    }
    homeScreenModelObj.value.points.value =
        (int.parse(homeScreenModelObj.value.points.value) + 5).toString();
    userDict['monthly'] += 5;
    user.setString('user', jsonEncode(userDict));
    points.value = (int.parse(points.value) + 5).toString();
  }

  Future<void> _getProfilePic() async {
    profilepic = await ApiService.fetchProfilePicture();
    update();
  }

  Future<void> _getUsername() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    String encodedUser = user.getString('user') ?? "";
    Map userDict = jsonDecode(encodedUser);
    username.value = userDict['fullname'].split(' ')[0];
    streaks.value = userDict['streaks'].toString();
    points.value = userDict['points'].toString();
    month_streaks.value = userDict['monthlyStreak'].toString();

    update();
  }

  Future<void> updateInfo() async {
    await ApiService.updatedInfo();
    _getUsername();
    homeScreenModelObj.value.getStreaksAndPointsFromSharedPrefs();
    HomeScreenController(this.homeScreenModelObj);
    update();
  }
}
