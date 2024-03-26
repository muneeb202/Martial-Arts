
import 'package:get/get_rx/src/rx_types/rx_types.dart';

/// This class is used in the [rremovebgprev_item_widget] screen.
class RremovebgprevItemModel {
  RremovebgprevItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
