import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/streaks_one_page/models/streaks_one_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/services/ApiService.dart';
import 'dart:developer';

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
    } catch (e) {
      log('Error fetching top users by points: $e');
    }
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
