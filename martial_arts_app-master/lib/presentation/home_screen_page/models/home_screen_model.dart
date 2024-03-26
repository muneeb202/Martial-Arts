import 'dart:convert';
import 'dart:math';

import 'package:martial_art/services/ApiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_export.dart';
import 'userprofilelist_item_model.dart';
import 'studentactivitieslist_item_model.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [home_screen_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeScreenModel {
  final RxString streaks = RxString('0');
  final RxString points = RxString('0');
  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([]);
  Rx<List<StudentactivitieslistItemModel>> studentactivitieslistItemList =
      Rx([]);

  HomeScreenModel() {
    // ... existing code (if any)
    getStreaksAndPointsFromSharedPrefs(); // Call function to retrieve values on creation
  }

  Future<void> getStreaksAndPointsFromSharedPrefs() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    String encodedUser = user.getString('user') ?? "";
    Map userDict = jsonDecode(encodedUser);

    Map completed = await ApiService.get_activities();
    set_activities(completed);

    DateTime now = DateTime.now();
    int currentDayOfMonth = now.day;
    int minstreak = min<int>(currentDayOfMonth, userDict['streaks']);
    streaks.value = max(minstreak, int.parse(streaks.value)).toString();
    points.value = userDict['monthly'].toString();

    userprofileItemList.value = [
      UserprofileItemModel(
        streaksImage: ImageConstant.imgGroup8.obs,
        streaksText: "Streaks".obs,
        fiveHundredText: streaks,
        streaksImage1: ImageConstant.imgGroup5.obs,
        color: appTheme.deepOrange500.withOpacity(0.40).obs,
        color1: appTheme.deepOrange50001.obs,
      ),
      UserprofileItemModel(
        streaksImage: ImageConstant.imgFrame.obs,
        streaksText: "Points".obs,
        fiveHundredText: points,
        streaksImage1: ImageConstant.imgGroup7.obs,
        color: appTheme.deepPurple500.obs,
        color1: appTheme.deepPurple600.obs,
      ),
    ];
  }

  void set_activities(Map activities) {
    studentactivitieslistItemList.value = [
      StudentactivitieslistItemModel(
        bedImage1: ImageConstant.pic1.obs,
        bedImage2: ImageConstant.pic1_1.obs,
        bedText: "Made Bed in the morning?".obs,
        id: "1".obs,
        checkVal: activities.containsKey(1).obs,
      ),
      StudentactivitieslistItemModel(
        bedImage1: ImageConstant.pic2.obs,
        bedImage2: ImageConstant.pic2_2.obs,
        bedText: "Did exercise today?".obs,
        id: "2".obs,
        checkVal: activities.containsKey(2).obs,
      ),
      StudentactivitieslistItemModel(
        bedImage1: ImageConstant.pic3.obs,
        bedImage2: ImageConstant.pic3_3.obs,
        bedText: "Did you practice?".obs,
        id: "3".obs,
        checkVal: activities.containsKey(3).obs,
      )
    ];
  }

  Rx<List<UserprofilelistItemModel>> userprofilelistItemList = Rx([
    UserprofilelistItemModel(
      streaksImage: ImageConstant.imgGroup8.obs,
      streaksText: "Streaks".obs,
      fiveHundredText: "600".obs,
      streaksImage1: ImageConstant.imgGroup5.obs,
      color: appTheme.deepOrange500.obs,
      color1: appTheme.deepOrange50001.obs,
    ),
    UserprofilelistItemModel(
      streaksImage: ImageConstant.imgFrame.obs,
      streaksText: "Points".obs,
      fiveHundredText: "100".obs,
      streaksImage1: ImageConstant.imgGroup7.obs,
      color: appTheme.deepPurple500.obs,
      color1: appTheme.deepPurple600.obs,
    )
  ]);
}
