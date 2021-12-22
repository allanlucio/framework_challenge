import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../design_system/scaffold/fruit_shop_scaffold.dart';
import '../stores/cart/cart_bloc.dart';
import '../widgets/cart_page/cart_list.dart';
import '../widgets/cart_page/checkout_button.dart';
import '../widgets/cart_page/total_price.dart';

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
                    child: cart.items.isNotEmpty
                        ? CartList(cart: cart, cartBloc: cartBloc)
                        : Container(
                            child: Center(
                              child: Text(
                                "Seu carrinho ainda está vazio!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                  ),
                  Divider(thickness: 1),
                  Flexible(flex: 1, child: TotalPrice(totalPrice: cart.total)),
                  Flexible(
                    flex: 2,
                    child: CheckoutButton(
                      onPressed: cart.items.isNotEmpty
                          ? () => cartBloc.add(Checkout(cartEntity: cart))
                          : null,
                    ),
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
