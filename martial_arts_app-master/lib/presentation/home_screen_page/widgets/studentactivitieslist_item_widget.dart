import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:martial_art/presentation/home_screen_page/controller/home_screen_controller.dart';
import 'package:martial_art/presentation/progress_page/controller/progress_controller.dart';
import 'package:martial_art/services/ApiService.dart';
import '../../../core/app_export.dart';
import '../models/studentactivitieslist_item_model.dart';

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

    if (studentactivitieslistItemModelObj.updating!.isTrue) return;
    studentactivitieslistItemModelObj.isLoading!.value = true;
    studentactivitieslistItemModelObj.updating!.value = true;

    if (await ApiService.check_activity(
        studentactivitieslistItemModelObj.id!.value, '',false)) {
      studentactivitieslistItemModelObj.checkVal!.value = true;
      homeScreenController.updatePoints();
    }
    studentactivitieslistItemModelObj.updating!.value = false;
    studentactivitieslistItemModelObj.isLoading!.value = true;

  }

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Card(
      color: appTheme.whiteA700,
      elevation: 3.0,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 4),
        child: studentactivitieslistItemModelObj.isLoading!.value==false ? Container(
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
                  studentactivitieslistItemModelObj.checkVal!, check_activity),
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
        ) :  Lottie.asset('assets/lottie/loading.json',height: 50,width: 150),
      ),
    ));
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
                  ? Center(
                    child: Container(
                      child: Icon(Icons.done,
                      color: Colors.deepOrange,
                        size: 30,
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
