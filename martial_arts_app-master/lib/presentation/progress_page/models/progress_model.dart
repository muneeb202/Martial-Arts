import 'package:martial_art/services/ApiService.dart';

import '../../../core/app_export.dart';
import 'studentactivitieslist_item_model.dart';

/// This class defines the variables used in the [progress_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ProgressModel {
  Rx<List<StudentactivitieslistItemModel>> studentactivitieslistItemList =
      Rx([]);

  RxInt percentage = RxInt(0);

  ProgressModel() {
    getCompletedActivities();
  }

  Future<void> getCompletedActivities() async {
    Map<int, int> completed = await ApiService.get_all_activities();

    DateTime now = DateTime.now();
    int totalDays = now.day;

    int totalCompleted = 0;

    completed.forEach((key, value) {
      totalCompleted += value;
    });
    percentage.value = ((totalCompleted * 100) / (totalDays * 12)).round();

    studentactivitieslistItemList.value = [
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic1.obs,
          bedText: "Made Bed in the morning?".obs,
          miniText:
              '${((completed[1]! / totalDays) * 100).round()}% Complete'.obs,
          completed: completed[1]! * 100 / totalDays),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic2.obs,
          bedText: "Did exercise today?".obs,
          completed: completed[2]! * 100 / totalDays,
          miniText:
              '${((completed[2]! / totalDays) * 100).round()}% Complete'.obs),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic3.obs,
          bedText: "Did you practice?".obs,
          completed: completed[3]! * 100 / totalDays,
          miniText:
              '${((completed[3]! / totalDays) * 100).round()}% Complete'.obs),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic1.obs,
          bedText: "What made you smile today?".obs,
          miniText:
              '${((completed[4]! / totalDays) * 100).round()}% Complete'.obs,
          completed: completed[4]! * 100 / totalDays),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic2.obs,
          bedText: "What did you do well today?".obs,
          completed: completed[5]! * 100 / totalDays,
          miniText:
              '${((completed[5]! / totalDays) * 100).round()}% Complete'.obs),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic3.obs,
          bedText: "what did you enjoy today?".obs,
          completed: completed[6]! * 100 / totalDays,
          miniText:
              '${((completed[6]! / totalDays) * 100).round()}% Complete'.obs),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic4.obs,
          bedText: "What did you learn today?".obs,
          completed: completed[7]! * 100 / totalDays,
          miniText:
              '${((completed[7]! / totalDays) * 100).round()}% Complete'.obs),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic5.obs,
          bedText: "What did you do for the 1st time today?".obs,
          completed: completed[8]! * 100 / totalDays,
          miniText:
              '${((completed[8]! / totalDays) * 100).round()}% Complete'.obs),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic6.obs,
          bedText: "Who did you help today?".obs,
          completed: completed[9]! * 100 / totalDays,
          miniText:
              '${((completed[9]! / totalDays) * 100).round()}% Complete'.obs),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic7.obs,
          bedText: "What did you feel today?".obs,
          completed: completed[10]! * 100 / totalDays,
          miniText:
              '${((completed[10]! / totalDays) * 100).round()}% Complete'.obs),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic6.obs,
          bedText: "What was hard today?".obs,
          completed: completed[11]! * 100 / totalDays,
          miniText:
              '${((completed[11]! / totalDays) * 100).round()}% Complete'.obs),
      StudentactivitieslistItemModel(
          bedImage1: ImageConstant.pic7.obs,
          bedText: "What did you do about it?".obs,
          completed: completed[12]! * 100 / totalDays,
          miniText:
              '${((completed[12]! / totalDays) * 100).round()}% Complete'.obs),
    ];
  }
}
