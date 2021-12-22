import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../features/fruit_shop/presentation/stores/cart/cart_bloc.dart';

class FruitShopScaffold extends StatefulWidget {
  const FruitShopScaffold({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);
  final Widget title;
  final Widget body;

  @override
  State<FruitShopScaffold> createState() => _FruitShopScaffoldState();
}

class _FruitShopScaffoldState extends State<FruitShopScaffold> {
  late CartBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CartBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          bottom: PreferredSize(
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                height: 8,
              ),
              preferredSize: Size.fromHeight(6.0)),
          actions: [
            BlocBuilder<CartBloc, CartState>(
              bloc: bloc,
              builder: (context, state) {
                final ammount = state.maybeWhen(
                    loaded: (cart, message) => cart.items.length,
                    orElse: () => 0);
                return CartButton(
                  itemsAmmount: ammount,
                );
              },
            )
          ],
          title: widget.title),
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(), child: widget.body),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
    required this.itemsAmmount,
  }) : super(key: key);
  final int itemsAmmount;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: IconButton(
            onPressed: () => Modular.to.pushNamed("/fruit_shop/cart"),
            icon: Icon(
              Icons.shopping_cart_sharp,
              color: Colors.black,
            ),
          ),
        ),
        itemsAmmount != 0
            ? Positioned(
                right: 4,
                top: 5,
                child: Container(
                  height: 13,
                  width: 13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Center(
                      child: Text(
                    itemsAmmount.toString(),
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
