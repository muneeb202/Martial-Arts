import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:martial_art/core/app_export.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 2.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgVector,
      activeIcon: ImageConstant.imgVector,
      type: BottomBarEnum.Vector,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSettingsPrimary,
      activeIcon: ImageConstant.imgSettingsPrimary,
      type: BottomBarEnum.Settingsprimary,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      activeIcon: ImageConstant.imgHome,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgReward,
      activeIcon: ImageConstant.imgReward,
      type: BottomBarEnum.Reward,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgActivity,
      activeIcon: ImageConstant.imgActivity,
      type: BottomBarEnum.Activity,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100.v,
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        border: Border(
          top: BorderSide(
            color: appTheme.whiteA70001,
            width: 1.h,
          ),
        ),
      ),
      child: Obx(
        () => ConvexAppBar(
          backgroundColor: appTheme.whiteA70001,
          //showSelectedLabels: false,
          //showUnselectedLabels: false,
          //selectedFontSize: 0,
          //curveSize: 100,

          top: -30,
          elevation: 2,
          activeColor: appTheme.deepOrange50001,
          initialActiveIndex: selectedIndex.value,
          //currentIndex: selectedIndex.value,
          //type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return TabItem(
              icon: CustomImageView(
                imagePath: bottomMenuList[index].icon,
                height: 30.v,
                width: 30.h,
                color: appTheme.gray50001,
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].activeIcon,
                    height: 30.v,
                    width: 30.h,
                    color: appTheme.whiteA70001,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 3.v),
                  //   child: SizedBox(
                  //     width: 42.h,
                  //     child: Divider(),
                  //   ),
                  // ),
                ],
              ),
              title: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Vector,
  Settingsprimary,
  Reward,
  Activity,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:flutter/material.dart';

// class CustomBottomBar extends StatelessWidget {
//    CustomBottomBar({Key? key}) : super(key: key);
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {

//       _selectedIndex = index;

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: ConvexAppBar(
//         items: [
//           TabItem(icon: Icons.home, title: 'Home'),
//           TabItem(icon: Icons.map, title: 'Discovery'),
//           TabItem(icon: Icons.add, title: 'Add'),
//           TabItem(icon: Icons.message, title: 'Message'),
//           TabItem(icon: Icons.people, title: 'Profile'),
//         ],
//         initialActiveIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//       // Rest of your scaffold body
//     );
//   }
// }
