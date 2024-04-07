import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/lifecycle.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
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

// @override
// void $configureLifeCycle() {
//   // TODO: implement $configureLifeCycle
// }

// @override
// Disposer addListener(GetStateUpdate listener) {
//   // TODO: implement addListener
//   throw UnimplementedError();
// }

// @override
// Disposer addListenerId(Object? key, GetStateUpdate listener) {
//   // TODO: implement addListenerId
//   throw UnimplementedError();
// }

// @override
// void dispose() {
//   // TODO: implement dispose
// }

// @override
// void disposeId(Object id) {
//   // TODO: implement disposeId
// }

// @override
// // TODO: implement hasListeners
// bool get hasListeners => throw UnimplementedError();

// @override
// // TODO: implement initialized
// bool get initialized => throw UnimplementedError();

// @override
// // TODO: implement isClosed
// bool get isClosed => throw UnimplementedError();

// @override
// // TODO: implement listeners
// int get listeners => throw UnimplementedError();

// @override
// void notifyChildrens() {
//   // TODO: implement notifyChildrens
// }

// @override
// // TODO: implement onDelete
// InternalFinalCallback<void> get onDelete => throw UnimplementedError();

// @override
// void onInit() {
//   // TODO: implement onInit
// }

// @override
// void onReady() {
//   // TODO: implement onReady
// }

// @override
// // TODO: implement onStart
// InternalFinalCallback<void> get onStart => throw UnimplementedError();

// @override
// void refresh() {
//   // TODO: implement refresh
// }

// @override
// void refreshGroup(Object id) {
//   // TODO: implement refreshGroup
// }

// @override
// void removeListener(VoidCallback listener) {
//   // TODO: implement removeListener
// }

// @override
// void removeListenerId(Object id, VoidCallback listener) {
//   // TODO: implement removeListenerId
// }

// @override
// void update([List<Object>? ids, bool condition = true]) {
//   // TODO: implement update
// }
}
