import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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
