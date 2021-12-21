import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        color: Theme.of(context).colorScheme.background.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: height * 0.85,
              width: width,
              child: Hero(
                tag: product.name,
                child: Image.asset(
                  product.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              product.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
