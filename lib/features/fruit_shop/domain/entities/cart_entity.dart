import 'package:equatable/equatable.dart';

import 'cart_item_entity.dart';

class CartEntity extends Equatable {
  final Set<CartItemEntity> items;

  double get total {
    double result = 0;
    items.forEach((element) {
      result += element.total;
    });

    return result;
  }

  const CartEntity({required this.items});
  @override
  List<Object?> get props => [items];
}
