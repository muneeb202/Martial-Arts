import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:martial_art/presentation/streaks_one_page/models/streaks_one_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/services/ApiService.dart';

/// A controller class for the StreaksOnePage.
///
/// This class manages the state of the StreaksOnePage, including the
/// current streaksOneModelObj
class StreaksOneController extends GetxController {
  StreaksOneController(this.streaksOneModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<StreaksOneModel> streaksOneModelObj;

  RxList<Map<String, dynamic>> topUsersByStreaks = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filteredUsers = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTopUsersByStreaks();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  void fetchTopUsersByStreaks() async {
    try {
      final response = await ApiService.fetchTopUsersByStreaks();
      topUsersByStreaks.assignAll(response);
      filteredUsers.assignAll(topUsersByStreaks);
    } catch (e) {}
  }

  void filterUsers() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      filteredUsers.assignAll(topUsersByStreaks);
    } else {
      filteredUsers.assignAll(topUsersByStreaks
          .where((user) => user['fullname'].toLowerCase().contains(query)));
    }
  }
}
