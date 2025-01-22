import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/domain/entities/product_entity.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/product_view_model.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';

class CustomProductItem extends StatefulWidget {
  final int index;
  final DataEntity dataList;
  const CustomProductItem(
      {super.key, required this.index, required this.dataList});

  @override
  State<CustomProductItem> createState() => _CustomProductItemState();
}

class _CustomProductItemState extends State<CustomProductItem> {
  ProductViewModel viewModel = ProductViewModel(
    productsUseCase: injectableProductUseCase(),
    addToCartUseCase: injectableAddToCartUseCase(),
  );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductViewModel,ProductStates>(
      bloc: viewModel,
      builder:(context,state) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2.w, color: AppColors.darkGreyColor),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(13.r),
                              topRight: Radius.circular(13.r)),
                          child: Image.network(
                            widget.dataList.imageCover ?? '',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.w, top: 8.h),
                          child: ClipOval(
                            child: Material(
                              color: AppColors.whiteColor, // Button color
                              child: InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  width: 30.w,
                                  height: 30.h,
                                  child: const ImageIcon(
                                    AssetImage(AppAssets.favoriteIcon),
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(right: 8.w, left: 8.w),
                              child: Text(
                                widget.dataList.title ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodySmall,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  "EGP ${widget.dataList.priceAfterDiscount ??
                                      widget.dataList.price}",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodySmall,
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Text(
                                "${widget.dataList.priceAfterDiscount != null
                                    ? widget.dataList.price
                                    : ''}",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                    color: AppColors.darkGreyColor,
                                    fontSize: 14.sp,
                                    decoration: TextDecoration.lineThrough),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                                child: Text(
                                  'Review (${widget.dataList.ratingsAverage})',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodySmall,
                                ),
                              ),
                              Image.asset(AppAssets.reviewIcon)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
              child: ClipOval(
                child: InkWell(
                  onTap: () {
                     viewModel.addToCart(widget.dataList.id??'');
                  },
                  child: Material(
                    color: AppColors.primaryColor, // Button color
                    child: SizedBox(
                        width: 30.w,
                        height: 30.h,
                        child: const Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                        )),
                  ),
                ),
              ),
            )
          ],
        );
      }
    );
  }
}
