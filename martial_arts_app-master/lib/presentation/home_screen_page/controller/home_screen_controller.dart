import 'dart:convert';
import 'dart:developer';

import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/home_screen_page/models/home_screen_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the HomeScreenPage.
///
/// This class manages the state of the HomeScreenPage, including the
/// current homeScreenModelObj
class HomeScreenController extends GetxController {
  final Rx<HomeScreenModel> homeScreenModelObj;
  final RxString username = RxString(''); // Add a reactive string for username

  HomeScreenController(this.homeScreenModelObj);

  @override
  void onInit() {
    super.onInit();
    _getUsername(); // Call function to get username on initialization

    ever(username, (_) {
      // Update UI whenever username changes
      update(); // Trigger rebuild of HomeScreen using GetX update method
    });
  }

  Future<void> _getUsername() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    String encodedUser = user.getString('user') ?? "";
    Map userDict = jsonDecode(encodedUser);
    username.value = userDict['username'];
  }
}
