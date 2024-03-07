import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/presentation/streaks_one_page/models/streaks_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the StreaksOnePage.
///
/// This class manages the state of the StreaksOnePage, including the
/// current streaksOneModelObj
class StreaksOneController extends GetxController {
  StreaksOneController(this.streaksOneModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<StreaksOneModel> streaksOneModelObj;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
