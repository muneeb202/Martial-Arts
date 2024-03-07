import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martial_art/presentation/home_screen_container_screen/controller/home_screen_container_controller.dart';
import '../../../core/app_export.dart';
import '../models/studentactivitieslist_item_model.dart';
class StudentactivitieslistItemWidget extends StatelessWidget {
  StudentactivitieslistItemWidget(this.studentactivitieslistItemModelObj,
      {Key? key})
      : super(key: key);
  final StudentactivitieslistItemModel studentactivitieslistItemModelObj;
  final HomeScreenContainerController controller =
      Get.find<HomeScreenContainerController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        // elevation: 1.0,
        elevation: 2,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ExpansionTile(

          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide.none,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15),),
            side: BorderSide.none,
          ),
          trailing: Obx(
            () => _reusableCheckBox( studentactivitieslistItemModelObj.checkBoxVal!,(){
              studentactivitieslistItemModelObj.checkBoxVal!.value = !studentactivitieslistItemModelObj.checkBoxVal!.value;
            }),
          ),
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.symmetric(horizontal: 16),
          expandedAlignment: Alignment.centerLeft,
          collapsedTextColor: appTheme.gray700,
          textColor: appTheme.gray700,
          iconColor: appTheme.gray700,
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          collapsedIconColor: appTheme.gray700,
          initiallyExpanded: false,
          title: Container(
            height: 55,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Obx(
                        () => CustomImageView(
                          imagePath:
                              studentactivitieslistItemModelObj.bedImage1!.value,
                          height: 40.v,
                          width: 43.h,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8, top: 2, bottom: 5),
                    child: Obx(
                      () => Text(
                        studentactivitieslistItemModelObj.bedText!.value,
                        textAlign: TextAlign.left,
                        maxLines: null,
                        style: GoogleFonts.montserrat(
                          color: appTheme.gray700,
                          fontSize: 12,
                          // fontFamily: 'Noto Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          children: [
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Answer here',
                hintStyle: GoogleFonts.poppins(
                  color: appTheme.black900,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(250, 35)),
                  backgroundColor: MaterialStateProperty.all(
                    theme.colorScheme.primary,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(75),
                    ),
                  ),
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.successScreen);
                },
                child: Text(
                  'Submit',
                  style: GoogleFonts.poppins(
                      color: appTheme.whiteA70001
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _reusableCheckBox(Rx<bool> val,VoidCallback changeFunc){
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
            border : Border.all(color: Colors.deepOrangeAccent.withOpacity(0.5),width: 1),
          ),
          child: val.value==true ? Padding(
            padding:  EdgeInsets.all(2),
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(5),
                // border : Border.all(color: Colors.grey.withOpacity(0.5),width: 1),
              ),
            ),
          ) : Container(
          ),
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