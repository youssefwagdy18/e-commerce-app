import 'package:e_commerce_app/domain/entities/home_categ_or_brand_entity.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizedGridView extends StatelessWidget {
  final List<CategOrBrandDataEntity> data;
  const CustomizedGridView({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 16, crossAxisSpacing: 16, crossAxisCount: 2),
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CategoryItem(index: index,categData: data,);
          }),
    );
  }
}
