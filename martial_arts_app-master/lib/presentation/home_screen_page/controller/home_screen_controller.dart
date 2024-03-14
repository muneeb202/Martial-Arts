import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';
import 'package:martial_art/presentation/home_screen_page/models/userprofile_item_model.dart';
import 'package:martial_art/services/ApiService.dart';

import '../models/home_screen_model.dart';
import 'package:martial_art/core/app_export.dart';
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
    dev.log(imagePath);
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
    _getUsername(); // Call function to get username on initialization
    _getProfilePic();
    ever(points, (_) {
      // Update UI whenever username changes
      homeScreenModelObj.value.getStreaksAndPointsFromSharedPrefs();
      HomeScreenController(this.homeScreenModelObj);
      update(); // Trigger rebuild of HomeScreen using GetX update method
    });
  }

  void updatePoints() {
    completed.value++;
    if (completed.value == 12) {
      streaks.value = (int.parse(streaks.value) + 1).toString();
      month_streaks.value = (int.parse(month_streaks.value) + 1).toString();
      homeScreenModelObj.value.streaks.value = streaks.value;
    }
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
    username.value = userDict['username'];
    streaks.value = userDict['streaks'].toString();
    points.value = userDict['points'].toString();

    Map acts = await ApiService.get_activities();
    completed.value = acts.length;

    DateTime now = DateTime.now();

    // Get the current day of the month
    int currentDayOfMonth = now.day;

    // Get the total number of days in the current month
    int totalDaysInMonth = DateTime(now.year, now.month + 1, 0).day;
    month_streaks.value =
        min<int>(currentDayOfMonth, userDict['streaks']).toString();
    total_days.value = totalDaysInMonth.toString();
    update();
  }
}
