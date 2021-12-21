import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FruitShopScaffold extends StatelessWidget {
  const FruitShopScaffold(
      {Key? key,
      required this.title,
      required this.body,
      required this.onCartClick})
      : super(key: key);
  final Widget title;
  final Widget body;
  final Function() onCartClick;

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
                onPressed: onCartClick,
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
