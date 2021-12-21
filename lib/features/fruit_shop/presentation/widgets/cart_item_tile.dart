import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/double_extensions.dart';
import '../../../../design_system/widgets/buttons/elevated_button_ds.dart';
import '../../domain/entities/cart_item_entity.dart';
import 'products_container.dart';

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
          onPressed: item.ammount == 1 ? null : () => onDecremment(item),
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