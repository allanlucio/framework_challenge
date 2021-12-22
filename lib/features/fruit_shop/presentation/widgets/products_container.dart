import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/double_extensions.dart';
import '../../domain/entities/product_entity.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    Key? key,
    required this.height,
    this.width,
    required this.product,
    this.onClick,
  }) : super(key: key);

  final ProductEntity product;
  final Function(ProductEntity product)? onClick;
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick != null ? () => onClick!(product) : null,
      child: Container(
        height: height,
        color: Theme.of(context).colorScheme.background.withOpacity(0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 10,
              child: Container(
                padding: EdgeInsets.all(5),
                width: width,
                child: Hero(
                  tag: product.name,
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                color: Theme.of(context).colorScheme.background.withOpacity(1),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: height / 12 + 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      product.price.toBRLString(),
                      style: TextStyle(
                        fontSize: height / 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
