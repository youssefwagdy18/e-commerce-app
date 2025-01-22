import 'package:e_commerce_app/ui/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entities/home_categ_or_brand_entity.dart';

class CategoryItem extends StatelessWidget {
  final List<CategOrBrandDataEntity> categData;
  final int index;
  const CategoryItem({super.key, required this.categData, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Image.network((categData[index].image ?? ''),fit: BoxFit.fill,errorBuilder: (context, error, stackTrace) {
              return  Image.asset(AppAssets.womenFashion,fit: BoxFit.cover,); // Or any placeholder widget
            },),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          flex: 2,
          child: Text(
            categData[index].name ?? '',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        )
      ],
    );
  }
}
