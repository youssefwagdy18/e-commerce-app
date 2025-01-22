import 'package:e_commerce_app/ui/home/tabs/product_list_tab/widgets/custom_product_grid_view.dart';
import 'package:e_commerce_app/ui/utils/app_colors.dart';
import 'package:e_commerce_app/ui/utils/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatelessWidget {
  static const String routeName = 'Product List Tab';
  const ProductListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          children: [
            CustomSearchBar(onTextFieldTab: (){}, onAddToCartTab: (){}),
            const CustomProductGridView(),
            SizedBox(height: 16.h,)
          ],
        ),
      ),
    );
  }
}
