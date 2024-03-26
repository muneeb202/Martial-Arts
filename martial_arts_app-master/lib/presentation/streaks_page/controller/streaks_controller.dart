import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:martial_art/presentation/streaks_page/models/streaks_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the StreaksPage.
///
/// This class manages the state of the StreaksPage, including the
/// current streaksModelObj
class StreaksController extends GetxController {
  StreaksController(this.streaksModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<StreaksModel> streaksModelObj;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
