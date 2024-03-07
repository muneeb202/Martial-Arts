import '../../../core/app_export.dart';
import 'userprofilelist_item_model.dart';
import 'studentactivitieslist_item_model.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [home_screen_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeScreenModel {
  Rx<List<UserprofilelistItemModel>> userprofilelistItemList = Rx([
    UserprofilelistItemModel(
      streaksImage: ImageConstant.imgGroup8.obs,
      streaksText: "Streaks".obs,
      fiveHundredText: "500".obs,
      streaksImage1: ImageConstant.imgGroup5.obs,
      color: appTheme.deepOrange500.obs,
      color1: appTheme.deepOrange50001.obs,
    ),
    UserprofilelistItemModel(
      streaksImage: ImageConstant.imgFrame.obs,
      streaksText: "Points".obs,
      fiveHundredText: "100".obs,
      streaksImage1: ImageConstant.imgGroup7.obs,
      color: appTheme.deepPurple500.obs,
      color1: appTheme.deepPurple600.obs,
    )
  ]);

  Rx<List<StudentactivitieslistItemModel>> studentactivitieslistItemList = Rx([
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic1.obs,
      bedImage2: ImageConstant.pic1_1.obs,
      bedText: "Made Bed in the morning?".obs,
      checkVal: false.obs,
    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic2.obs,
      bedImage2: ImageConstant.pic2_2.obs,
      bedText: "Did exercise today?".obs,
      checkVal: false.obs,

    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic3.obs,
      bedImage2: ImageConstant.pic3_3.obs,
      bedText: "Did you practice?".obs,
      checkVal: false.obs,

    )
  ]);

  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([
    UserprofileItemModel(
      streaksImage: ImageConstant.imgGroup8.obs,
      streaksText: "Streaks".obs,
      fiveHundredText: "500".obs,
      streaksImage1: ImageConstant.imgGroup5.obs,
      color: appTheme.deepOrange500.withOpacity(0.40).obs,
      color1: appTheme.deepOrange50001.obs,
    ),
    UserprofileItemModel(
      streaksImage: ImageConstant.imgFrame.obs,
      streaksText: "Points".obs,
      fiveHundredText: "100".obs,
      streaksImage1: ImageConstant.imgGroup7.obs,
      color: appTheme.deepPurple500.obs,
      color1: appTheme.deepPurple600.obs,
    )
  ]);
  // UserprofilelistItemModel(
  // streaksImage: ImageConstant.imgGroup8.obs,
  // streaksText: "Streaks".obs,
  // fiveHundredText: "500".obs,
  // streaksImage1: ImageConstant.imgGroup5.obs,
  // color: appTheme.deepOrange500.obs,
  // color1: appTheme.deepOrange50001.obs,
  // ),
  // UserprofilelistItemModel(
  // streaksImage: ImageConstant.imgFrame.obs,
  // streaksText: "Points".obs,
  // fiveHundredText: "100".obs,
  // streaksImage1: ImageConstant.imgGroup7.obs,
  // color: appTheme.deepPurple500.obs,
  // color1: appTheme.deepPurple600.obs,
  // )
}
