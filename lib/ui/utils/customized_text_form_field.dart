import 'package:e_commerce_app/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizedTextFormField extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  bool obscureText;
  String? fieldName;
  Widget? suffixIcon;
  String? hintText;
  void Function()? suffixIconFunction;

  CustomizedTextFormField(
      {super.key,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.obscureText = false,
      required this.fieldName,
      this.suffixIcon,
      required this.hintText,
      this.suffixIconFunction});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 1.h),
          child: Text(
            fieldName!,
            style: Theme.of(context).textTheme.titleMedium,
           textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top: 24.h),
          child: TextFormField(
            validator: validator,
            keyboardType: keyboardType,
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.blackColor),
              filled: true,
              fillColor: AppColors.whiteColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide:  const BorderSide(color: AppColors.darkGreyColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: AppColors.darkGreyColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: AppColors.darkGreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: AppColors.darkGreyColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: AppColors.darkGreyColor),
              ),
            ),
          ),
        )
      ],
    );
  }
}
