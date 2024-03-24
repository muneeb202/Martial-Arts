
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:martial_art/presentation/register_tab_container_screen/models/register_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the RegisterTabContainerScreen.
///
/// This class manages the state of the RegisterTabContainerScreen, including the
/// current registerTabContainerModelObj
class RegisterTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<RegisterTabContainerModel> registerTabContainerModelObj =
      RegisterTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));

  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
  }

  void getArguments(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;

    if (arguments != null && arguments.containsKey("initialTabIndex")) {
      final initialTabIndex = arguments["initialTabIndex"] as int;
      tabviewController = TabController(
        vsync: this,
        length: 2,
        initialIndex: initialTabIndex,
      );
    } else {
      tabviewController = TabController(
        vsync: this,
        length: 2,
      );
    }
  }

  @override
  void onInit() {
    getArguments(Get.context!);
    tabviewController.addListener(() {
      changeIndex(tabviewController.index);
      update();
    });
    super.onInit();
  }

  @override
  void dispose() {
    tabviewController.dispose();
    super.dispose();
  }
}
