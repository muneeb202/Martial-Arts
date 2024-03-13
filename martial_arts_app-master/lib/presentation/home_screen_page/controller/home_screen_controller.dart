import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:martial_art/presentation/home_screen_page/models/userprofile_item_model.dart';

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

  HomeScreenController(this.homeScreenModelObj);

  @override
  void onInit() {
    super.onInit();
    _getUsername(); // Call function to get username on initialization

    ever(points, (_) {
      // Update UI whenever username changes
      homeScreenModelObj.value.getStreaksAndPointsFromSharedPrefs();
      HomeScreenController(this.homeScreenModelObj);
      update(); // Trigger rebuild of HomeScreen using GetX update method
    });
  }

  void updatePoints() {
    points.value = (int.parse(points.value) + 5).toString();
  }

  Future<void> _getUsername() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    String encodedUser = user.getString('user') ?? "";
    Map userDict = jsonDecode(encodedUser);
    username.value = userDict['username'];
    streaks.value = userDict['streaks'].toString();
    points.value = userDict['points'].toString();

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
