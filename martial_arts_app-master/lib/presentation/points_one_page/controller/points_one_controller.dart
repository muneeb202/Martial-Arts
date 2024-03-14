import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/points_one_page/models/points_one_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/services/ApiService.dart';
import 'dart:developer';

/// A controller class for the PointsOnePage.
///
/// This class manages the state of the PointsOnePage, including the
/// current pointsOneModelObj
class PointsOneController extends GetxController {
  PointsOneController(this.pointsOneModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<PointsOneModel> pointsOneModelObj;

  RxList<Map<String, dynamic>> topUsersByPoints = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filteredUsers = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTopUsersByPoints();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  void fetchTopUsersByPoints() async {
    try {
      final response = await ApiService.fetchTopUsersByPoints();
      topUsersByPoints.assignAll(response);
      filteredUsers.assignAll(topUsersByPoints);
      update();
    } catch (e) {
      log('Error fetching top users by points: $e');
    }
  }

  void filterUsers() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      filteredUsers.assignAll(topUsersByPoints);
    } else {
      filteredUsers.assignAll(topUsersByPoints
          .where((user) => user['fullname'].toLowerCase().contains(query)));
    }
  }
}
