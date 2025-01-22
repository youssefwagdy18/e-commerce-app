import 'package:e_commerce_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileComponent extends StatelessWidget {
  final String title;
  final String argument;
  const CustomProfileComponent({super.key,required this.title,required this.argument});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(left: 16.w,right: 16.w,bottom: 24.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title , style: Theme.of(context)
                  .textTheme
                  .bodyMedium,),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            height: 54.h,
            width: 398.w,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.w, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(argument , style: Theme.of(context)
                      .textTheme
                      .bodyMedium!.copyWith(color: AppColors.darkGreyTextColor),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
