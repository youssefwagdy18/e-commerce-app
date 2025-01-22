import 'package:e_commerce_app/ui/auth/login_screen/login_screen.dart';
import 'package:e_commerce_app/ui/utils/app_colors.dart';
import 'package:e_commerce_app/ui/home/tabs/profile_tab/widgets/custom_profile_component.dart';
import 'package:e_commerce_app/ui/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_assets.dart';

class ProfileTab extends StatelessWidget {
  static const String routeName = 'Profile Tab';
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 6.h, bottom: 24.h),
              child: Image.asset(AppAssets.routeAppTitle),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wlecome .....',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  IconButton(onPressed: (){
                    SharedPreferenceUtils.removeData(key: 'Token');
                    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName,(route) => false,);
                  }, icon: Icon(Icons.logout,
                    color: AppColors.primaryColor,
                  size: 30.sp,),)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 17.w, bottom: 40.h),
              child: Text(
                'name@gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.darkGreyTextColor),
              ),
            ),
            const CustomProfileComponent(
                title: 'Your full name', argument: 'full name'),
            const CustomProfileComponent(
                title: 'Your E-mail', argument: 'Your E-mail'),
            const CustomProfileComponent(
                title: 'Your password', argument: 'Your password'),
            const CustomProfileComponent(
                title: 'Your mobile number', argument: 'Your mobile number'),
          ],
        ),
      ),
    );
  }
}
