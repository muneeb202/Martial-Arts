import '../../../core/app_export.dart';
import 'studentactivitieslist_item_model.dart';

/// This class defines the variables used in the [progress_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ProgressModel {
  Rx<List<StudentactivitieslistItemModel>> studentactivitieslistItemList = Rx([
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic1.obs,
      bedText: "Made Bed in the morning?".obs,
    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic2.obs,
      bedText: "Did exercise today?".obs,
    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic3.obs,
      bedText: "Did you practice?".obs,
    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic4.obs,
      bedText: "What did you learn today?".obs,
    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic5.obs,
      bedText: "What did you enjoy today?".obs,
    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic6.obs,
      bedText: "What did you do well today?".obs,
    ),
    StudentactivitieslistItemModel(
      bedImage1: ImageConstant.pic7.obs,
      bedText: "What made you smile today?".obs,
    ),
  ]);
}
