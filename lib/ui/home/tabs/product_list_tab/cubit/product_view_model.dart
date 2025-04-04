import 'package:e_commerce_app/domain/use_case/add_to_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_case/products_use_case.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/entities/product_entity.dart';

class ProductViewModel extends Cubit<ProductStates> {
  ProductViewModel(
      {required this.productsUseCase, required this.addToCartUseCase})
      : super(InitialProductState());
  ProductsUseCase productsUseCase;
  AddToCartUseCase addToCartUseCase;
  List<DataEntity> data = [];
  num numbOfItemsInCart = 0;

  void getProducts() async {
    emit(
      LoadingProductState(loading: 'Loading ...'),
    );
    var either = await productsUseCase.invoke();
    return either.fold(
      (left) {
        emit(FailureProductState(failureEntity: left));
      },
      (response) {
        data = response.data!;
        emit(
          SuccessProductState(productEntity: response),
        );
      },
    );

  }


  void addToCart(String productId) async {
    emit(
      AddToCartLoadingState(loading: 'loading ... '),
    );
    var either = await addToCartUseCase.invoke(productId);
    return either.fold(
      (fail) {
        emit(
          AddToCartFailureState(failureEntity: fail),
        );
      },
      (response) {
        numbOfItemsInCart = response.numOfCartItems!;
        emit(
          AddToCartSuccessState(addToCartEntity: response),
        );
      },
    );
  }


}
