import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

/// This class is used in the [userprofilelist_item_widget] screen.
class UserprofilelistItemModel {
  UserprofilelistItemModel({
    this.streaksImage,
    this.streaksText,
    this.fiveHundredText,
    this.streaksImage1,
    this.id,
    this.color,
    this.color1,
  }) {
    streaksImage = streaksImage ?? Rx(ImageConstant.imgGroup8);
    streaksText = streaksText ?? Rx("Streaks");
    fiveHundredText = fiveHundredText ?? Rx("500");
    streaksImage1 = streaksImage1 ?? Rx(ImageConstant.imgGroup5);
    id = id ?? Rx("");
    color = color ?? Rx(theme.colorScheme.primary);
    color1 = color1 ?? Rx(theme.colorScheme.primary);
  }

  Rx<String>? streaksImage;

  Rx<String>? streaksText;

  Rx<String>? fiveHundredText;

  Rx<String>? streaksImage1;

  Rx<String>? id;

  Rx<Color>? color;

  Rx<Color>? color1;
}
