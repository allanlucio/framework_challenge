import 'package:equatable/equatable.dart';

import 'cart_item_entity.dart';

class CartEntity extends Equatable {
  final Set<CartItemEntity> items;

  const CartEntity({required this.items});
  @override
  List<Object?> get props => [items];
}
