import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/points_tab_container_page/models/points_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the PointsTabContainerPage.
///
/// This class manages the state of the PointsTabContainerPage, including the
/// current pointsTabContainerModelObj
class PointsTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PointsTabContainerController(this.pointsTabContainerModelObj);

  Rx<PointsTabContainerModel> pointsTabContainerModelObj;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
