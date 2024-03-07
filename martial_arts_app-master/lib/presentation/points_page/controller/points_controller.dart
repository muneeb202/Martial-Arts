import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/points_page/models/points_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the PointsPage.
///
/// This class manages the state of the PointsPage, including the
/// current pointsModelObj
class PointsController extends GetxController {
  PointsController(this.pointsModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<PointsModel> pointsModelObj;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
