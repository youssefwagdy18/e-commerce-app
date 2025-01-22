import 'package:e_commerce_app/ui/home/product_details/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsViewModel extends Cubit<ProductDetailsState> {
  ProductDetailsViewModel() : super(ProductDetailsInitialState());
  int index=1;
  void addItems(){
    emit(ProductDetailsLoadingState());
    index= ++index;
    emit(AddItemState());
  }
  void decreaseItem(){
    emit(ProductDetailsLoadingState());
    if(index >=2){
      index= --index;
    }else{
      index=index;
    }
    emit(DecreaseItemState());
  }
}
