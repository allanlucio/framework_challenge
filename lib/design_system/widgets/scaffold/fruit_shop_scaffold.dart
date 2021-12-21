import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FruitShopScaffold extends StatelessWidget {
  const FruitShopScaffold({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);
  final Widget title;
  final Widget body;

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
              IconButton(
                onPressed: () => Modular.to.pushNamed("/fruit_shop/cart"),
                icon: Icon(
                  Icons.shopping_cart_sharp,
                  color: Colors.black,
                ),
              )
            ],
            title: title),
        body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(), child: body));
  }
}
