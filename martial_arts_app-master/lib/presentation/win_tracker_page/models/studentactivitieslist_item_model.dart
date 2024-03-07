import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

/// This class is used in the [studentactivitieslist_item_widget] screen.
class StudentactivitieslistItemModel {
  Rx<String>? bedImage1;

  Rx<String>? bedImage2;

  Rx<String>? bedText;


  Rx<String>? id;

  Rx<Color>? color;
  Rx<bool>? checkBoxVal;
  StudentactivitieslistItemModel({
    this.bedImage1,
    this.bedImage2,
    this.bedText,
    this.id,
    this.color,
    this.checkBoxVal,
  }) {
    bedImage1 = bedImage1 ?? Rx(ImageConstant.imgClose);
    bedImage2 = bedImage2 ?? Rx(ImageConstant.imgBedClock);
    bedText = bedText ?? Rx("Made Bed in the morning?");
    id = id ?? Rx("");
    color = color ?? Rx(theme.colorScheme.primary);
    checkBoxVal = checkBoxVal ?? Rx(false);
  }


}
