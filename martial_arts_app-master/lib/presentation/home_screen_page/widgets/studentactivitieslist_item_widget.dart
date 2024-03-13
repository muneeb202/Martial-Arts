import 'package:flutter/material.dart';
import 'package:martial_art/presentation/home_screen_page/controller/home_screen_controller.dart';
import 'package:martial_art/presentation/progress_page/controller/progress_controller.dart';
import 'package:martial_art/services/ApiService.dart';
import '../../../core/app_export.dart';
import '../models/studentactivitieslist_item_model.dart';
import 'package:martial_art/presentation/win_tracker_page/controller/win_tracker_controller.dart';

class StudentactivitieslistItemWidget extends StatelessWidget {
  StudentactivitieslistItemWidget(
    this.studentactivitieslistItemModelObj, {
    Key? key,
  }) : super(key: key);

  final StudentactivitieslistItemModel studentactivitieslistItemModelObj;

  final ProgressController controller = Get.find<ProgressController>();

  final HomeScreenController homeScreenController =
      Get.find<HomeScreenController>();

  Future<void> check_activity() async {
    if (studentactivitieslistItemModelObj.checkVal!.value) return;

    if (await ApiService.check_activity(
        studentactivitieslistItemModelObj.id!.value)) {
      studentactivitieslistItemModelObj.checkVal!.value = true;
      homeScreenController.updatePoints();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appTheme.whiteA700,
      elevation: 3.0,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 4),
        child: Container(
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 70.h,
          // width: double.infinity,
          // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: CustomImageView(
                    imagePath:
                        studentactivitieslistItemModelObj.bedImage1!.value,
                    height: 40.v,
                    width: 40.h,
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  studentactivitieslistItemModelObj.bedText!.value,
                  textAlign: TextAlign.left,
                  maxLines: null,
                  style: TextStyle(
                    color: appTheme.gray700,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              // Expanded(
              //   child: Padding(
              //     padding: EdgeInsets.only(left: 12, top: 5, bottom: 5),
              //     child: Obx(
              //           () => Text(
              //         studentactivitieslistItemModelObj.bedText!.value,
              //         textAlign: TextAlign.left,
              //         maxLines: null,
              //         style: TextStyle(
              //           color: appTheme.gray700,
              //           fontSize: 13,
              //           fontFamily: 'Poppins',
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              _reusableCheckBox(
                  studentactivitieslistItemModelObj.checkVal!, check_activity
                  //   () {
                  // studentactivitieslistItemModelObj.checkVal!.value =
                  //     !studentactivitieslistItemModelObj.checkVal!.value;
                  ),
              // Obx(
              //       () => CustomImageView(
              //     imagePath:
              //     studentactivitieslistItemModelObj.bedImage2!.value,
              //     height: 30,
              //     width: 30,
              //     margin: EdgeInsets.only(
              //       top: 5,
              //       bottom: 4,
              //       right: 13,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _reusableCheckBox(Rx<bool> val, VoidCallback changeFunc) {
    print("------------------");
    print(val);
    return Obx(() => Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: changeFunc,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: Colors.deepOrangeAccent.withOpacity(0.5), width: 1),
              ),
              child: val.value == true
                  ? Padding(
                      padding: EdgeInsets.all(2),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(5),
                          // border : Border.all(color: Colors.grey.withOpacity(0.5),width: 1),
                        ),
                      ),
                    )
                  : Container(),
            ),
          ),
        ));

    // return Checkbox(
    //   activeColor: Colors.green,
    //   shape: ContinuousRectangleBorder(
    //     borderRadius: BorderRadius.circular(8),
    //     side: BorderSide(color: Colors.grey.withOpacity(0.1),width: 0.5),
    //   ),
    //   visualDensity: VisualDensity.compact,
    //   value: val,
    //   onChanged: (bool? value){
    //     onChanged?.call(value!);
    //   },
    // );
  }
}
