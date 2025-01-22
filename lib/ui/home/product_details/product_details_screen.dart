import 'package:e_commerce_app/domain/entities/product_entity.dart';
import 'package:e_commerce_app/ui/home/product_details/cubit/product_details_view_model.dart';
import 'package:e_commerce_app/ui/home/product_details/cubit/states.dart';
import 'package:e_commerce_app/ui/utils/app_assets.dart';
import 'package:e_commerce_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = 'Product details screen';
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsViewModel viewModel = ProductDetailsViewModel();
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as DataEntity;
    return BlocBuilder<ProductDetailsViewModel, ProductDetailsState>(
      bloc: viewModel
        ..addItems()
        ..decreaseItem(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.primaryColor,
                )),
            backgroundColor: AppColors.whiteColor,
            centerTitle: true,
            title: Text(
              'Product Details',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage(AppAssets.searchIcon),
                  color: AppColors.primaryColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage(AppAssets.shoppingCartIcon),
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(
              right: 16.w,
              left: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.w,
                          color: AppColors.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(20.r)),
                    child: ImageSlideshow(
                      autoPlayInterval: 3000,
                      indicatorColor: AppColors.primaryColor,
                      indicatorBackgroundColor: AppColors.whiteColor,
                      indicatorRadius: 5.sp,
                      width: 400.w,
                      height: 200.h,
                      initialPage: 0,
                      isLoop: true,
                      children: args.images!
                          .map(
                            (url) => ClipRRect(
                              borderRadius: BorderRadius.circular(18.r),
                              child: Image.network(
                                url,
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Text(
                            args.title ?? '',
                            overflow: TextOverflow.visible,
                              maxLines: 2,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      args.priceAfterDiscount == null
                          ? Flexible(
                            child: Text(
                                "EGP ${args.price.toString()}",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                          )
                          : Flexible(
                            child: Text(
                                "EGP ${args.priceAfterDiscount.toString()}",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                          )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: Container(
                          height: 40.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.w, color: AppColors.darkGreyColor),
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Center(
                              child: Text(
                            "${args.sold.toString()} Sold",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                      Image.asset(AppAssets.reviewIcon),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "${args.ratingsAverage.toString()}  (${args.ratingsQuantity})",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Container(
                        width: 120.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.primaryColor,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  viewModel.decreaseItem();
                                },
                                child: const ImageIcon(
                                  AssetImage(AppAssets.subtractIcon),
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Text(
                                "${viewModel.index}",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              InkWell(
                                onTap: () {
                                  viewModel.addItems();
                                },
                                child: const ImageIcon(
                                  AssetImage(AppAssets.plusIcon),
                                  color: AppColors.whiteColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Text(
                    "Description",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Text(args.description ?? '',
                      style: Theme.of(context).textTheme.bodySmall),
                ),
                const Spacer(),
                Row(
                  children: [
                    Column(
                      children: [
                        Text("Total Price :",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.darkGreyTextColor)),
                        Text(
                            "EGP ${viewModel.index * (args.priceAfterDiscount ?? args.price!)}")
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50.h,
                        width: 270.w,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const ImageIcon(
                              AssetImage(AppAssets.shoppingCartIcon),
                              color: AppColors.whiteColor,
                            ),
                            Text(
                              "Add to Cart",
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 100.h,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
