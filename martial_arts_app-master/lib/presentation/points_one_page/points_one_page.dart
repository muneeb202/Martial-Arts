import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/usersListTile.dart';
import 'controller/points_one_controller.dart';
import 'models/points_one_model.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';
import 'package:martial_art/widgets/custom_search_view.dart';
class PointsOnePage extends StatelessWidget {
  PointsOnePage({Key? key}) : super(key: key);
  PointsOneController controller =
      Get.put(PointsOneController(PointsOneModel().obs));
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        // backgroundColor: Color.fromRGBO(255, 255, 255, 1),

        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 18.v),
                _buildMaskColumn5(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMaskColumn5() {
    return Align(
      alignment: Alignment.bottomRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 27.h),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 9.h,
                  right: 30.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 59.v,
                        bottom: 2.v,
                      ),
                      child: _buildMaskColumn1(
                        frameText: "lbl_2".tr,
                        titleText: "lbl_mirayk".tr,
                        spanText: "lbl_426".tr,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.h),
                      child: Animate(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 90.adaptSize,
                              width: 90.adaptSize,
                              margin: EdgeInsets.only(left: 2.h),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgMask70x70,
                                    height: 70.adaptSize,
                                    width: 70.adaptSize,
                                    radius: BorderRadius.circular(
                                      35.h,
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgVectorPrimary,
                                    height: 90.adaptSize,
                                    width: 90.adaptSize,
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4.v),
                            SizedBox(
                              height: 164.v,
                              width: 97.h,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 21.h,
                                      top: 24.v,
                                      right: 21.h,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,

                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15.h),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 7.h,
                                            vertical: 1.v,
                                          ),
                                          decoration: AppDecoration
                                              .outlinePrimary2
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder10,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "lbl_1".tr,
                                              style: TextStyle(
                                                color: theme.colorScheme.primary,
                                                fontSize: 16.fSize,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 14.v),
                                        Text(
                                          "lbl_amelia".tr,
                                          style: TextStyle(
                                            color: appTheme.gray900,
                                            fontSize: 15.fSize,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "lbl_720".tr,
                                          style: TextStyle(
                                            color: appTheme.whiteA700,
                                            fontSize: 20.fSize,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _buildMaskColumn(
                                    dynamicText1: "lbl_1".tr,
                                    dynamicText2: "lbl_amelia".tr,
                                    dynamicText3: "lbl_5002".tr,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).flipH(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 18.h,
                        top: 49.v,
                        bottom: 2.v,
                      ),
                      child: _buildMaskColumn2(
                        frameText: "lbl_3".tr,
                        titleText: "lbl_onur_o".tr,
                        spanText: "lbl_412".tr,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 35.h, top: 30),
                child: Card(
                  elevation: 1,
                  color: appTheme.whiteA700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Container(
                    height: 50,
                    child: TextFormField(

                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.search),
                        prefixIconColor: Colors.grey.shade600,
                        hintText: "lbl_search_user".tr,
                        hintStyle: TextStyle(
                          fontSize: 14,              fontFamily: 'Poppins',

                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                        fillColor: appTheme.whiteA700,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.h),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.h),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.h),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  // child: CustomSearchView(
                  //   filled: true,
                  //   fillColor: appTheme.whiteA700,
                  //   controller: controller.searchController,
                  //   hintText: "lbl_search_user".tr,
                  // ),
                ),
              ),
              SizedBox(height: 28.v),
              userListTile(),
              SizedBox(height: 50,)
              // SizedBox(
              //   height: 433.v,
              //   width: 366.h,
              //   child: Stack(
              //     alignment: Alignment.bottomLeft,
              //     children: [
              //       Align(
              //         alignment: Alignment.centerLeft,
              //         child: Container(
              //           height: 433.v,
              //           width: 346.h,
              //           decoration: BoxDecoration(
              //             color: appTheme.whiteA700,
              //             borderRadius: BorderRadius.circular(
              //               30.h,
              //             ),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: appTheme.deepOrange10001,
              //                 spreadRadius: 2.h,
              //                 blurRadius: 2.h,
              //                 offset: Offset(
              //                   0,
              //                   2,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Align(
              //         alignment: Alignment.bottomLeft,
              //         child: Padding(
              //           padding: EdgeInsets.only(bottom: 34.v),
              //           child: SizedBox(
              //             width: 113.h,
              //             child: Divider(
              //               color: appTheme.red700,
              //               indent: 71.h,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Align(
              //         alignment: Alignment.topCenter,
              //         child: Padding(
              //           padding: EdgeInsets.only(
              //             left: 7.h,
              //             top: 14.v,
              //           ),
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Card(
              //                 clipBehavior: Clip.antiAlias,
              //                 elevation: 0,
              //                 margin: EdgeInsets.all(0),
              //                 color: appTheme.whiteA700,
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadiusStyle.circleBorder16,
              //                 ),
              //                 child: Container(
              //                   height: 68.v,
              //                   width: 329.h,
              //                   padding: EdgeInsets.symmetric(
              //                     horizontal: 16.h,
              //                     vertical: 13.v,
              //                   ),
              //                   decoration:
              //                       AppDecoration.fillWhiteA700.copyWith(
              //                     borderRadius:
              //                         BorderRadiusStyle.circleBorder16,
              //                   ),
              //                   child: Stack(
              //                     alignment: Alignment.topCenter,
              //                     children: [
              //                       // Align(
              //                       //   alignment: Alignment.centerLeft,
              //                       //   child: Container(
              //                       //     height: 36.adaptSize,
              //                       //     width: 36.adaptSize,
              //                       //     decoration: BoxDecoration(
              //                       //       borderRadius: BorderRadius.circular(
              //                       //         18.h,
              //                       //       ),
              //                       //       border: Border.all(
              //                       //         color: appTheme.indigoA700,
              //                       //         width: 2.h,
              //                       //       ),
              //                       //     ),
              //                       //   ),
              //                       // ),
              //                       _buildZeroStackRow1(
              //                         zero: "lbl_0".tr,
              //                         emoji: "lbl_1".tr,
              //                         title: "lbl_amelia_tovias".tr,
              //                         streaksCounter: "lbl_500_streaks".tr,
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               Card(
              //                 clipBehavior: Clip.antiAlias,
              //                 elevation: 0,
              //                 margin: EdgeInsets.all(0),
              //                 color: appTheme.whiteA700,
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadiusStyle.circleBorder16,
              //                 ),
              //                 child: Container(
              //                   height: 72.v,
              //                   width: 329.h,
              //                   padding: EdgeInsets.all(16.h),
              //                   decoration:
              //                       AppDecoration.fillWhiteA700.copyWith(
              //                     borderRadius:
              //                         BorderRadiusStyle.circleBorder16,
              //                   ),
              //                   child: Stack(
              //                     alignment: Alignment.center,
              //                     children: [
              //                       // Align(
              //                       //   alignment: Alignment.centerLeft,
              //                       //   child: Container(
              //                       //     height: 36.adaptSize,
              //                       //     width: 36.adaptSize,
              //                       //     decoration: BoxDecoration(
              //                       //       borderRadius: BorderRadius.circular(
              //                       //         18.h,
              //                       //       ),
              //                       //       border: Border.all(
              //                       //         color: appTheme.indigoA700,
              //                       //         width: 2.h,
              //                       //       ),
              //                       //     ),
              //                       //   ),
              //                       // ),
              //                       Align(
              //                         alignment: Alignment.center,
              //                         child: Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.center,
              //                           children: [
              //                             Padding(
              //                               padding: EdgeInsets.only(
              //                                 top: 1.v,
              //                                 bottom: 3.v,
              //                               ),
              //                               child: _buildZeroStackRow(
              //                                 zero: "lbl_0".tr,
              //                                 emoji: "lbl_2".tr,
              //                               ),
              //                             ),
              //                             Padding(
              //                               padding:
              //                                   EdgeInsets.only(left: 20.h),
              //                               child: Column(
              //                                 crossAxisAlignment:
              //                                     CrossAxisAlignment.start,
              //                                 children: [
              //                                   Text(
              //                                     "msg_mirayk_cirrincione".tr,
              //                                     style: TextStyle(
              //                                       color: theme
              //                                           .colorScheme.primary,
              //                                       fontSize: 14.fSize,
              //                                       fontFamily: 'Poppins',
              //                                       fontWeight: FontWeight.w700,
              //                                       overflow:
              //                                           TextOverflow.ellipsis,
              //                                     ),
              //                                   ),
              //                                   Text(
              //                                     "lbl_426_streaks".tr,
              //                                     style: TextStyle(
              //                                       color: appTheme.gray500,
              //                                       fontSize: 12.fSize,
              //                                       fontFamily: 'Poppins',
              //                                       fontWeight: FontWeight.w900,
              //                                       overflow:
              //                                           TextOverflow.ellipsis,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                             CustomImageView(
              //                               imagePath:
              //                                   ImageConstant.imgPlayWhiteA700,
              //                               height: 28.adaptSize,
              //                               width: 28.adaptSize,
              //                               margin: EdgeInsets.only(
              //                                 left: 87.h,
              //                                 top: 1.v,
              //                                 bottom: 3.v,
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 72.v,
              //                 width: 359.h,
              //                 child: Stack(
              //                   alignment: Alignment.center,
              //                   children: [
              //                     Align(
              //                       alignment: Alignment.centerLeft,
              //                       child: Container(
              //                         height: 74.v,
              //                         width: 329.h,
              //                         decoration: BoxDecoration(
              //                           color: appTheme.whiteA700,
              //                           borderRadius: BorderRadius.circular(
              //                             16.h,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                     Align(
              //                       alignment: Alignment.center,
              //                       child: Padding(
              //                         padding: EdgeInsets.only(
              //                           left: 16.h,
              //                           top: 16.v,
              //                           bottom: 16.v,
              //                         ),
              //                         child: Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.spaceBetween,
              //                           children: [
              //                             SizedBox(
              //                               height: 38.adaptSize,
              //                               width: 36.adaptSize,
              //                               child: Stack(
              //                                 alignment: Alignment.center,
              //                                 children: [
              //                                   // Align(
              //                                   //   alignment: Alignment.center,
              //                                   //   child: Container(
              //                                   //     height: 36.adaptSize,
              //                                   //     width: 36.adaptSize,
              //                                   //     decoration: BoxDecoration(
              //                                   //       borderRadius:
              //                                   //           BorderRadius.circular(
              //                                   //         18.h,
              //                                   //       ),
              //                                   //       border: Border.all(
              //                                   //         color:
              //                                   //             appTheme.indigoA700,
              //                                   //         width: 2.h,
              //                                   //       ),
              //                                   //     ),
              //                                   //   ),
              //                                   // ),
              //                                   Align(
              //                                     alignment: Alignment.center,
              //                                     child: Text(
              //                                       "lbl_0".tr,
              //                                       style: TextStyle(
              //                                         color: appTheme.whiteA700,
              //                                         fontSize: 12.fSize,
              //                                         fontFamily: 'Poppins',
              //                                         fontWeight:
              //                                             FontWeight.w900,
              //                                         overflow:
              //                                             TextOverflow.ellipsis,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                   Align(
              //                                     alignment: Alignment.center,
              //                                     child: Text(
              //                                       "lbl_3".tr,
              //                                       style: TextStyle(
              //                                         color: theme
              //                                             .colorScheme.primary,
              //                                         fontSize: 20.fSize,
              //                                         fontFamily: 'Poppins',
              //                                         fontWeight:
              //                                             FontWeight.w600,
              //                                         overflow:
              //                                             TextOverflow.ellipsis,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                             Container(
              //                               height: 24.v,
              //                               width: 25.h,
              //                               margin: EdgeInsets.only(
              //                                 top: 8.v,
              //                                 bottom: 4.v,
              //                               ),
              //                               decoration: BoxDecoration(
              //                                 color: appTheme.red100,
              //                                 borderRadius:
              //                                     BorderRadius.circular(
              //                                   4.h,
              //                                 ),
              //                                 boxShadow: [
              //                                   BoxShadow(
              //                                     color: appTheme.deepOrange50,
              //                                     spreadRadius: 2.h,
              //                                     blurRadius: 2.h,
              //                                     offset: Offset(
              //                                       0,
              //                                       0,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                     Align(
              //                       alignment: Alignment.centerRight,
              //                       child: Padding(
              //                         padding: EdgeInsets.fromLTRB(
              //                             64.h, 15.v, 46.h, 15.v),
              //                         child: Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.spaceBetween,
              //                           children: [
              //                             Column(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               children: [
              //                                 Text(
              //                                   "lbl_onur_o".tr,
              //                                   style: TextStyle(
              //                                     color:
              //                                         theme.colorScheme.primary,
              //                                     fontSize: 15.fSize,
              //                                     fontFamily: 'Poppins',
              //                                     fontWeight: FontWeight.w700,
              //                                     overflow:
              //                                         TextOverflow.ellipsis,
              //                                   ),
              //                                 ),
              //                                 Text(
              //                                   "lbl_412_streaks".tr,
              //                                   style: TextStyle(
              //                                     color: appTheme.gray700
              //                                         .withOpacity(0.69),
              //                                     fontSize: 12.fSize,
              //                                     fontFamily: 'Poppins',
              //                                     fontWeight: FontWeight.w900,
              //                                     overflow:
              //                                         TextOverflow.ellipsis,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             CustomImageView(
              //                               imagePath:
              //                                   ImageConstant.imgPlayWhiteA700,
              //                               height: 28.adaptSize,
              //                               width: 28.adaptSize,
              //                               margin: EdgeInsets.only(
              //                                 top: 5.v,
              //                                 bottom: 4.v,
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               Card(
              //                 clipBehavior: Clip.antiAlias,
              //                 elevation: 0,
              //                 margin: EdgeInsets.all(0),
              //                 color: appTheme.whiteA700,
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadiusStyle.circleBorder16,
              //                 ),
              //                 child: Container(
              //                   height: 68.v,
              //                   width: 329.h,
              //                   padding: EdgeInsets.symmetric(
              //                     horizontal: 16.h,
              //                     vertical: 15.v,
              //                   ),
              //                   decoration:
              //                       AppDecoration.fillWhiteA700.copyWith(
              //                     borderRadius:
              //                         BorderRadiusStyle.circleBorder16,
              //                   ),
              //                   child: Stack(
              //                     alignment: Alignment.center,
              //                     children: [
              //                       // Align(
              //                       //   alignment: Alignment.centerLeft,
              //                       //   child: Container(
              //                       //     height: 36.adaptSize,
              //                       //     width: 36.adaptSize,
              //                       //     decoration: BoxDecoration(
              //                       //       borderRadius: BorderRadius.circular(
              //                       //         18.h,
              //                       //       ),
              //                       //       border: Border.all(
              //                       //         color: appTheme.indigoA700,
              //                       //         width: 2.h,
              //                       //       ),
              //                       //     ),
              //                       //   ),
              //                       // ),
              //                       Align(
              //                         alignment: Alignment.center,
              //                         child: Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.center,
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             Padding(
              //                               padding: EdgeInsets.only(
              //                                 top: 1.v,
              //                                 bottom: 3.v,
              //                               ),
              //                               child: _buildZeroStackRow(
              //                                 zero: "lbl_0".tr,
              //                                 emoji: "lbl_4".tr,
              //                               ),
              //                             ),
              //                             Padding(
              //                               padding:
              //                                   EdgeInsets.only(left: 20.h),
              //                               child: Column(
              //                                 crossAxisAlignment:
              //                                     CrossAxisAlignment.start,
              //                                 children: [
              //                                   Text(
              //                                     "lbl_layla_schupbach".tr,
              //                                     style: TextStyle(
              //                                       color: theme
              //                                           .colorScheme.primary,
              //                                       fontSize: 14.fSize,
              //                                       fontFamily: 'Poppins',
              //                                       fontWeight: FontWeight.w700,
              //                                       overflow:
              //                                           TextOverflow.ellipsis,
              //                                     ),
              //                                   ),
              //                                   Text(
              //                                     "lbl_388_streaks".tr,
              //                                     style: TextStyle(
              //                                       color: appTheme.gray500,
              //                                       fontSize: 12.fSize,
              //                                       fontFamily: 'Poppins',
              //                                       overflow:
              //                                           TextOverflow.ellipsis,
              //                                       fontWeight: FontWeight.w900,
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                             CustomImageView(
              //                               imagePath:
              //                                   ImageConstant.imgPlayWhiteA700,
              //                               height: 28.adaptSize,
              //                               width: 28.adaptSize,
              //                               margin: EdgeInsets.only(
              //                                 left: 97.h,
              //                                 top: 1.v,
              //                                 bottom: 3.v,
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               Card(
              //                 clipBehavior: Clip.antiAlias,
              //                 elevation: 0,
              //                 margin: EdgeInsets.all(0),
              //                 color: appTheme.whiteA700,
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadiusStyle.circleBorder16,
              //                 ),
              //                 child: Container(
              //                   height: 68.v,
              //                   width: 329.h,
              //                   padding: EdgeInsets.symmetric(
              //                     horizontal: 16.h,
              //                     vertical: 13.v,
              //                   ),
              //                   decoration:
              //                       AppDecoration.fillWhiteA700.copyWith(
              //                     borderRadius:
              //                         BorderRadiusStyle.circleBorder16,
              //                   ),
              //                   child: Stack(
              //                     alignment: Alignment.center,
              //                     children: [
              //                       // Align(
              //                       //   alignment: Alignment.centerLeft,
              //                       //   child: Container(
              //                       //     height: 36.adaptSize,
              //                       //     width: 36.adaptSize,
              //                       //     decoration: BoxDecoration(
              //                       //       borderRadius: BorderRadius.circular(
              //                       //         18.h,
              //                       //       ),
              //                       //       border: Border.all(
              //                       //         color: appTheme.indigoA700,
              //                       //         width: 2.h,
              //                       //       ),
              //                       //     ),
              //                       //   ),
              //                       // ),
              //                       _buildZeroStackRow1(
              //                         zero: "lbl_0".tr,
              //                         emoji: "lbl_5".tr,
              //                         title: "lbl_amelia_tovias".tr,
              //                         streaksCounter: "lbl_378_streaks".tr,
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildMaskColumn({
    required String dynamicText1,
    required String dynamicText2,
    required String dynamicText3,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30.adaptSize,
            // margin: EdgeInsets.only(right: 12.h),
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 2.v,
            ),
            decoration: AppDecoration.outlinePrimary2.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder16,
            ),
            child: Center(
              child: Text(
                dynamicText1,
                style: GoogleFonts.montserrat(
              color: theme.colorScheme.primary,
                fontSize: 20.fSize,
                // fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),

              ),
            ),
          ),
          SizedBox(height: 9.v),
          Text(
            dynamicText2,
            style: TextStyle(
              color: appTheme.gray900,
              fontSize: 15.fSize,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 42.v),
          Text(
            dynamicText3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16.fSize,
                // fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                // overflow: TextOverflow.ellipsis,
              ),

          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildMaskColumn1({
    required String frameText,
    required String titleText,
    required String spanText,
  }) {


    return Animate(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgMask1,
              height: 70.adaptSize,
              width: 70.adaptSize,
              radius: BorderRadius.circular(
                35.h,
              ),
            ),
            SizedBox(height: 11.v),
            Container(
              // height: selected.value ? 130 : 0,
              padding: EdgeInsets.symmetric(
                horizontal: 19.h,
                vertical: 12.v,
              ),
              decoration: AppDecoration.fillPrimary2.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder10,
                color: Color.fromRGBO(255, 92, 0, .6),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // width: 30.adaptSize,
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.h,
                      vertical: 2.v,
                    ),
                    decoration: AppDecoration.outlinePrimary2.copyWith(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        frameText,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          color: theme.colorScheme.primary,
                          fontSize: 20.fSize,
                          // fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Text(
                    titleText,
                    style: TextStyle(
                      color: appTheme.gray900,
                      fontSize: 14.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 13.v),
                  RichText(

                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_4122".tr,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16.fSize,
                              // fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              // overflow: TextOverflow.ellipsis,
                            ),

                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
    ).scale();
  }

  Widget _buildMaskColumn2({
    required String frameText,
    required String titleText,
    required String spanText,
  }) {


    return Animate(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMask1,
            height: 70.adaptSize,
            width: 70.adaptSize,
            radius: BorderRadius.circular(
              35.h,
            ),
          ),
          SizedBox(height: 11.v),
          Container(
            // height: selected.value ? 130 : 0,
            padding: EdgeInsets.symmetric(
              horizontal: 19.h,
              vertical: 8.v,
            ),
            decoration: AppDecoration.fillPrimary2.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder10,
              color: Color.fromRGBO(255, 92, 0, .3),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // width: 30.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.h,
                    vertical: 2.v,
                  ),
                  decoration: AppDecoration.outlinePrimary2.copyWith(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      frameText,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        color: theme.colorScheme.primary,
                        fontSize: 20.fSize,
                        // fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 7.v),
                Text(
                  titleText,
                  style: TextStyle(
                    color: appTheme.gray900,
                    fontSize: 14.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 8.v),
                RichText(

                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl_4122".tr,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16.fSize,
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          // overflow: TextOverflow.ellipsis,
                        ),

                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    ).scale();
  }

  /// Common widget
  Widget _buildZeroStackRow({
    required String zero,
    required String emoji,
  }) {
    return SizedBox(
      height: 30.v,
      width: 20.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              zero,
              style: TextStyle(
                color: appTheme.whiteA700,
                fontSize: 12.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              emoji,
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 20.fSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildZeroStackRow1({
    required String zero,
    required String emoji,
    required String title,
    required String streaksCounter,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30.v,
          width: 20.h,
          margin: EdgeInsets.only(
            top: 5.v,
            bottom: 4.v,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  zero,
                  style: TextStyle(
                    color: appTheme.whiteA700,
                    fontSize: 12.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  emoji,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 20.fSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 15.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                streaksCounter,
                style: TextStyle(
                  color: appTheme.gray700.withOpacity(0.69),
                  fontSize: 13.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgPlayWhiteA700,
          height: 28.adaptSize,
          width: 28.adaptSize,
          margin: EdgeInsets.only(
            left: 112.h,
            top: 5.v,
            bottom: 4.v,
          ),
        ),
      ],
    );
  }
}
