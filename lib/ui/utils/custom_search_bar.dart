import 'package:e_commerce_app/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final VoidCallback onTextFieldTab;
  final VoidCallback onAddToCartTab;

   const CustomSearchBar(
      {required this.onTextFieldTab, super.key, required this.onAddToCartTab,
      });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w,top: 6.h,bottom: 18.h),
              child: Image.asset(AppAssets.routeAppTitle),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 50.h,
                  child: TextField(
                    onTap: onTextFieldTab,
                    decoration: InputDecoration(
                      hintText: 'What do you search for?',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      prefixIcon: ImageIcon(
                        const AssetImage(AppAssets.searchIcon),
                        size: 24.sp,
                      ),
                      prefixIconColor: AppColors.primaryColor,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
