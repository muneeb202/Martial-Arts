import '../../../core/app_export.dart';

/// This class is used in the [rremovebgprev_item_widget] screen.
class RremovebgprevItemModel {
  RremovebgprevItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
