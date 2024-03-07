import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martial_art/presentation/progress_page/controller/progress_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        color: appTheme.whiteA700,
        // elevation: 1.0,
        elevation: 2,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            borderRadius: BorderRadius.circular(15),
          ),
          height:70,
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
                  padding: EdgeInsets.only(left: 12, top: 5, bottom: 5),
                  child: Obx(() => RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: studentactivitieslistItemModelObj
                                  .bedText!.value,
                              style: GoogleFonts.montserrat(
                                color: appTheme.gray700,
                                fontSize: 12,
                                // fontFamily: 'Noto Sans',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(text: '\n'),
                            TextSpan(
                              text: studentactivitieslistItemModelObj
                                  .miniText!.value,
                              style: GoogleFonts.poppins(
                                color: appTheme.gray700,
                                fontSize:
                                    12, // This sets the size of the second text to 11.
                                // fontFamily: 'Noto Sans',
                                fontWeight: FontWeight
                                    .w500, // This makes the second text normal.
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  height: 23,
                  width: 23,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
