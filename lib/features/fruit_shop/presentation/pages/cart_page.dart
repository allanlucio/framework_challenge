import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../design_system/widgets/buttons/elevated_button_ds.dart';
import '../../../../design_system/widgets/scaffold/fruit_shop_scaffold.dart';
import '../../domain/entities/cart_entity.dart';
import '../stores/cart/cart_bloc.dart';
import '../widgets/cart_item_tile.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 10,
            child: BlocBuilder<CartBloc, CartState>(
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
          ),
          Flexible(
              flex: 1,
              child: ElevatedButtonDS(
                title: "Finalizar",
                icon: Icons.check,
                onPressed: () => null,
                buttomColor: Theme.of(context).colorScheme.primary,
              ))
        ],
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
