import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/extensions/double_extensions.dart';
import '../../../../design_system/widgets/buttons/elevated_button_ds.dart';
import '../../../../design_system/widgets/scaffold/fruit_shop_scaffold.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../stores/cart/cart_bloc.dart';
import '../widgets/products_container.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartBloc cartBloc;
  @override
  void initState() {
    super.initState();
    cartBloc = Modular.get<CartBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return FruitShopScaffold(
      title: Center(
          child: Text(
        "Carrinho",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: BlocBuilder<CartBloc, CartState>(
        bloc: cartBloc,
        builder: (context, state) {
          return state.when(
            loaded: (cart, message) {
              return CartList(
                cart: cart,
                cartBloc: cartBloc,
              );
            },
          );
        },
      ),
    );
  }
}

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

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    Key? key,
    required this.item,
    required this.onDecremment,
    required this.onIncremment,
    required this.onRemove,
  }) : super(key: key);

  final CartItemEntity item;
  final Function(CartItemEntity) onDecremment;
  final Function(CartItemEntity) onIncremment;
  final Function(CartItemEntity) onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          ProductContainer(height: 150, product: item.product),
          Expanded(
            child: Container(
              height: 150,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Quantidade: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CartItemControls(
                    item: item,
                    onDecremment: onDecremment,
                    onIncremment: onIncremment,
                  ),
                  Container(
                    height: 30,
                    child: ElevatedButtonDS(
                      fontSize: 18,
                      title: "Remover",
                      icon: Icons.delete_forever_rounded,
                      onPressed: () => onRemove(item),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Total: ${item.total.toBRLString()}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CartItemControls extends StatelessWidget {
  const CartItemControls({
    Key? key,
    required this.item,
    required this.onDecremment,
    required this.onIncremment,
  }) : super(key: key);

  final CartItemEntity item;
  final Function(CartItemEntity) onDecremment;
  final Function(CartItemEntity) onIncremment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () => onDecremment(item),
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 30,
          ),
        ),
        Text(
          "${item.ammount.toString()}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () => onIncremment(item),
          icon: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
          ),
        ),
      ],
    );
  }
}
