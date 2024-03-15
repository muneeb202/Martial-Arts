import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

/// This class is used in the [studentactivitieslist_item_widget] screen.
class StudentactivitieslistItemModel {
  StudentactivitieslistItemModel(
      {this.bedImage1,
      this.bedText,
      this.miniText,
      this.id,
      this.color,
      this.completed}) {
    bedImage1 = bedImage1 ?? Rx(ImageConstant.pic1);
    bedText = bedText ?? Rx("Made Bed in the morning?");
    miniText = miniText ?? Rx("75% Complete");
    id = id ?? Rx("");
    color = color ?? Rx(theme.colorScheme.primary);
    completed = completed ?? 0;
  }

  Rx<String>? bedImage1;

  Rx<String>? bedText;

  Rx<String>? miniText;

  Rx<String>? id;

  Rx<Color>? color;

  double? completed;
}
