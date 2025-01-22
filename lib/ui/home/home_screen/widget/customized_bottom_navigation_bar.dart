import 'package:e_commerce_app/ui/utils/app_assets.dart';
import 'package:e_commerce_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customizedBottomNavigationBar(
    {required int selectedIndex,
    required Function(int) onTapFunction,
    required BuildContext context}) {
  return ClipRRect(
    child: BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
      onTap: onTapFunction,
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
            icon: CircleAvatar(
          radius: 20.r,
          backgroundColor: selectedIndex == 0
              ? AppColors.whiteColor
              : AppColors.primaryColor,
          foregroundColor: selectedIndex == 0
              ? AppColors.primaryColor
              : AppColors.whiteColor,
          child: ImageIcon(
            const AssetImage(AppAssets.homeIcon),
            size: 40.sp,
          ),
        )),
        BottomNavigationBarItem(
          label: 'Category',
            icon: CircleAvatar(
          radius: 20.r,
          backgroundColor: selectedIndex == 1
              ? AppColors.whiteColor
              : AppColors.primaryColor,
          foregroundColor: selectedIndex == 1
              ? AppColors.primaryColor
              : AppColors.whiteColor,
          child: ImageIcon(
            const AssetImage(AppAssets.categoryIcon),
            size: 40.sp,
          ),
        )),
        BottomNavigationBarItem(
          label: 'Favorites',
            icon: CircleAvatar(
          radius: 20.r,
          backgroundColor: selectedIndex == 2
              ? AppColors.whiteColor
              : AppColors.primaryColor,
          foregroundColor: selectedIndex == 2
              ? AppColors.primaryColor
              : AppColors.whiteColor,
          child: ImageIcon(
            const AssetImage(AppAssets.favoriteIcon),
            size: 40.sp,
          ),
        )),
        BottomNavigationBarItem(
          label: 'Profile',
            icon: CircleAvatar(
          radius: 20.r,
          backgroundColor: selectedIndex == 3
              ? AppColors.whiteColor
              : AppColors.primaryColor,
          foregroundColor: selectedIndex == 3
              ? AppColors.primaryColor
              : AppColors.whiteColor,
          child: ImageIcon(
            const AssetImage(AppAssets.userIcon),
            size: 40.sp,
          ),
        )),
      ],
    ),
  );
}
