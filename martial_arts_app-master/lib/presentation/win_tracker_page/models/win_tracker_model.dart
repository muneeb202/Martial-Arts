import 'package:martial_art/services/ApiService.dart';
import '../../../core/app_export.dart';
import 'studentactivitieslist_item_model.dart';

/// This class defines the variables used in the [win_tracker_page],
/// and is typically used to hold data that is passed between different parts of the application.
class WinTrackerModel {
  Rx<List<StudentactivitieslistItemModel>> studentactivitieslistItemList =
      Rx([]);

  RxInt completed = RxInt(0);

  WinTrackerModel() {
    getCompletedActivities(); // Call function to retrieve values on creation
  }

  Future<void> getCompletedActivities() async {
    Map activities = await ApiService.get_activities();
    completed.value = activities.length;
    activities.forEach((key, value) {
      if (key < 4) {
        completed.value--;
      }
    });

    studentactivitieslistItemList.value = [
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic1.obs,
          bedImage2: ImageConstant.pic1_1.obs,
          bedText: "What made you smile today?".obs,
          id: "4".obs,
          checkBoxVal: activities.containsKey(4).obs,
          answer: RxString(activities[4] ?? '')),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic2.obs,
          bedImage2: ImageConstant.pic2_2.obs,
          bedText: "What did you do well today?".obs,
          id: "5".obs,
          checkBoxVal: activities.containsKey(5).obs,
          answer: RxString(activities[5] ?? '')),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic3.obs,
          bedImage2: ImageConstant.pic3_3.obs,
          bedText: "what did you enjoy today?".obs,
          id: "6".obs,
          checkBoxVal: activities.containsKey(6).obs,
          answer: RxString(activities[6] ?? '')),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic4.obs,
          bedImage2: ImageConstant.pic1_1.obs,
          bedText: "What did you learn today?".obs,
          id: "7".obs,
          checkBoxVal: activities.containsKey(7).obs,
          answer: RxString(activities[7] ?? '')),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic5.obs,
          bedImage2: ImageConstant.pic2_2.obs,
          bedText: "What did you do for the 1st time today?".obs,
          id: "8".obs,
          checkBoxVal: activities.containsKey(8).obs,
          answer: RxString(activities[8] ?? '')),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic6.obs,
          bedImage2: ImageConstant.pic1_1.obs,
          bedText: "Who did you help today?".obs,
          id: "9".obs,
          checkBoxVal: activities.containsKey(9).obs,
          answer: RxString(activities[9] ?? '')),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic7.obs,
          bedImage2: ImageConstant.pic2_2.obs,
          bedText: "What did you feel today?".obs,
          id: "10".obs,
          checkBoxVal: activities.containsKey(10).obs,
          answer: RxString(activities[10] ?? '')),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic6.obs,
          bedImage2: ImageConstant.pic1_1.obs,
          bedText: "What was hard today?".obs,
          id: "11".obs,
          checkBoxVal: activities.containsKey(11).obs,
          answer: RxString(activities[11] ?? '')),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic7.obs,
          bedImage2: ImageConstant.pic2_2.obs,
          bedText: "What did you do about it?".obs,
          id: "12".obs,
          checkBoxVal: activities.containsKey(12).obs,
          answer: RxString(activities[12] ?? ''))
    ];
  }
}
