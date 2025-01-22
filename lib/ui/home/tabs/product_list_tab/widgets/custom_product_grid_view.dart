import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/states.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/di.dart';
import '../../../product_details/product_details_screen.dart';
import '../cubit/product_view_model.dart';

class CustomProductGridView extends StatefulWidget {
  const CustomProductGridView({super.key});

  @override
  State<CustomProductGridView> createState() => _CustomProductGridViewState();
}

class _CustomProductGridViewState extends State<CustomProductGridView> {
  ProductViewModel viewModel = ProductViewModel(
    addToCartUseCase: injectableAddToCartUseCase(),
    productsUseCase: injectableProductUseCase(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductViewModel>(
      create: (context)=>viewModel..getProducts(),
      child: BlocBuilder<ProductViewModel, ProductStates>(
        builder: (context, states) {
          if (states is LoadingProductState) {
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (states is FailureProductState) {
            return Center(
              child: Text(states.failureEntity!.errorMsg!),
            );
          } else if (states is SuccessProductState) {
            return Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(
                    left: 16.w, top: 16.h, right: 16.w, bottom: 16.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 3 / 4),
                itemCount: states.productEntity?.data?.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 200,
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context, ProductDetailsScreen.routeName,
                            arguments: viewModel.data[index]
                          );
                        },
                        child: CustomProductItem(
                          index: index,
                          dataList: viewModel.data[index],
                        )),
                  );
                },
              ),
            );
          }
          return  Container(
            color: Colors.black,
          );
        },
      ),
    );
  }
}
