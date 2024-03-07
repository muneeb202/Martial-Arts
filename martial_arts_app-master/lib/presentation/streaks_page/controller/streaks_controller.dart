import 'package:martial_art/core/app_export.dart';
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
