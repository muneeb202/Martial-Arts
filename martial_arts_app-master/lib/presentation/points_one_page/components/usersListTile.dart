import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martial_art/core/app_export.dart';
import '../../../theme/theme_helper.dart';
import '../controller/points_one_controller.dart';

Widget userListTile(RxList<Map<String, dynamic>> topUsersByPoints) {
  return Animate(
    child: Padding(
      padding: const EdgeInsets.only(right: 35),
      child: Container(
        // height: 433.v,
        width: 346.h,
        decoration: BoxDecoration(
          color: appTheme.whiteA700,
          borderRadius: BorderRadius.circular(
            30.h,
          ),
          boxShadow: [
            BoxShadow(
              color: appTheme.deepOrange10001,
              spreadRadius: .5.h,
              blurRadius: 2.h,
              offset: Offset(
                0,
                2,
              ),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (var i = 0; i < topUsersByPoints.length; i++)
                  _buildLisTile(
                      (i + 1).toString(),
                      topUsersByPoints[i]['fullname'],
                      topUsersByPoints[i]['points'].toString() + ' Points',
                      topUsersByPoints[i]['profilepic'] ?? ""),
              ],
            ),
          ),
        ),
      ),
    ),
  ).scaleX();
}

Widget _buildLisTile(
    String rank, String name, String streaks, String imagePath) {
  return ListTile(
    title: Text(
      name,
      style: GoogleFonts.montserrat(
        color: theme.colorScheme.primary,
        fontSize: 14.fSize,
        // fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        // overflow: TextOverflow.ellipsis,
      ),
    ),
    subtitle: Text(
      streaks,
      style: TextStyle(
        color: appTheme.gray500,
        fontSize: 12.fSize,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    leading: Text(
      rank,
      style: GoogleFonts.montserrat(
        color: theme.colorScheme.primary,
        fontSize: 18.fSize,
        // fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        // overflow: TextOverflow.ellipsis,
      ),
    ),
    trailing: CustomImageView(
      imagePath: imagePath.isEmpty ? ImageConstant.imgDefault : imagePath,
      height: 30.adaptSize,
      width: 28.adaptSize,
      margin: EdgeInsets.only(
        left: 87.h,
        top: 1.v,
        bottom: 3.v,
      ),
      radius: BorderRadius.circular(15.h),
    ),
  );
}
