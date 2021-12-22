import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/extensions/double_extensions.dart';
import '../../../../design_system/form/buttons/elevated_button_ds.dart';
import '../../../../design_system/scaffold/fruit_shop_scaffold.dart';
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
      body: BlocBuilder<CartBloc, CartState>(
        bloc: cartBloc,
        builder: (context, state) {
          return state.when(
            loaded: (cart, message) {
              return Column(
                children: [
                  Flexible(
                    flex: 12,
                    child: CartList(cart: cart, cartBloc: cartBloc),
                  ),
                  Divider(thickness: 1),
                  Flexible(flex: 1, child: TotalPrice(totalPrice: cart.total)),
                  Flexible(
                    flex: 2,
                    child: CheckoutButton(cartBloc: cartBloc, cart: cart),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Total da compra: ${totalPrice.toBRLString()}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    Key? key,
    required this.cartBloc,
    required this.cart,
  }) : super(key: key);

  final CartBloc cartBloc;
  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ElevatedButtonDS(
        title: "Finalizar",
        icon: Icons.check,
        onPressed: cart.items.isNotEmpty
            ? () {
                cartBloc.add(Checkout(cartEntity: cart));
              }
            : null,
        buttomColor: Theme.of(context).colorScheme.primary,
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
