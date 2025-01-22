import 'package:e_commerce_app/domain/entities/add_to_cart_entity.dart';

class AddToCartDto extends AddToCartEntity {
  AddToCartDto({
    super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    this.statusMsg,
    super.data,});

  AddToCartDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddToCartDataDto.fromJson(json['data']) : null;
  }

  String? statusMsg;


}

class AddToCartDataDto extends AddToCartDataEntity{
  AddToCartDataDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,});

  AddToCartDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddToCartsProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }


}

class AddToCartsProductsDto extends AddToCartProductsEntity {
  AddToCartsProductsDto({
    super.count,
    super.id,
    super.product,
    super.price,});

  AddToCartsProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }



}