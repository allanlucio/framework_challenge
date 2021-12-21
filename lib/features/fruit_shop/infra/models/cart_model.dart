import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/cart_item_entity.dart';

class CartModel extends CartEntity {
  CartModel({required Set<CartItemEntity> items}) : super(items: items);

  factory CartModel.fromEntity(CartEntity entity) {
    return CartModel(items: entity.items);
  }
}
