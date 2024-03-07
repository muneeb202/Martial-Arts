import '../../../core/app_export.dart';
import 'studentactivitieslist_item_model.dart';

/// This class defines the variables used in the [win_tracker_page],
/// and is typically used to hold data that is passed between different parts of the application.
class WinTrackerModel {
  Rx<List<StudentactivitieslistItemModel>> studentactivitieslistItemList = Rx([
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic1.obs,
      bedImage2: ImageConstant.pic1_1.obs,
      bedText: "Made Bed in the morning?".obs,
      checkBoxVal: false.obs,
    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic2.obs,
      bedImage2: ImageConstant.pic2_2.obs,
      bedText: "Did exercise today?".obs,
      checkBoxVal: false.obs,
    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic3.obs,
      bedImage2: ImageConstant.pic3_3.obs,
      bedText: "Did you practice?".obs,
      checkBoxVal: false.obs,
    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic4.obs,
      bedImage2: ImageConstant.pic1_1.obs,
      bedText: "What did you learn today?".obs,
      checkBoxVal: false.obs,
    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic5.obs,
      bedImage2: ImageConstant.pic2_2.obs,
      bedText: "What did you enjoy today?".obs,
      checkBoxVal: false.obs,
    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic6.obs,
      bedImage2: ImageConstant.pic1_1.obs,
      bedText: "What did you do well today?".obs,
      checkBoxVal: false.obs,
    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic7.obs,
      bedImage2: ImageConstant.pic2_2.obs,
      bedText: "What made you smile today?".obs,
      checkBoxVal: false.obs,
    ),
  ]);
}
