import 'package:flutter/cupertino.dart';

import '../../../domain/entities/cart_entity.dart';
import '../../stores/cart/cart_bloc.dart';
import 'cart_item_tile.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key, required this.cart, required this.cartBloc})
      : super(key: key);
  final CartEntity cart;
  final CartBloc cartBloc;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) {
        final item = cart.items.toList()[index];
        return CartItemTile(
          item: item,
          onDecremment: (item) => cartBloc.add(
            CartEvent.decrementAmmount(cartProduct: item),
          ),
          onIncremment: (item) => cartBloc.add(
            CartEvent.incrementAmmount(cartProduct: item),
          ),
          onRemove: (item) => cartBloc.add(
            CartEvent.removeProduct(cartProduct: item),
          ),
        );
      },
    );
  }
}
