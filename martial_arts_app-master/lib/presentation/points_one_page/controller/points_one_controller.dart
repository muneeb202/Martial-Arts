import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/points_one_page/models/points_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the PointsOnePage.
///
/// This class manages the state of the PointsOnePage, including the
/// current pointsOneModelObj
class PointsOneController extends GetxController {
  PointsOneController(this.pointsOneModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<PointsOneModel> pointsOneModelObj;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
