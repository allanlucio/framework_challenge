import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../design_system/snackbar/snackbar.dart';
import '../../../../design_system/widgets/buttons/elevated_button_ds.dart';
import '../../../../design_system/widgets/scaffold/fruit_shop_scaffold.dart';
import '../../domain/entities/product_entity.dart';
import '../stores/cart/cart_bloc.dart';
import '../widgets/products_container.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);
  final ProductEntity product;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late CartBloc cartBloc;
  @override
  void initState() {
    super.initState();
    cartBloc = Modular.get<CartBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return FruitShopScaffold(
      title: Center(child: Text(widget.product.name)),
      body: BlocListener<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          state.when(loaded: (cart, message) {
            if (message != null) {
              SnackBarDS.success(context, message: message);
            }
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ProductContainer(
                height: 250,
                width: double.infinity,
                product: widget.product,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "Caracteristicas",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(widget.product.description),
            ),
            ElevatedButtonDS(
              onPressed: () => cartBloc.add(
                AddProduct(
                  product: widget.product,
                ),
              ),
              title: "Adicionar",
              icon: Icons.shopping_cart_sharp,
            ),
          ],
        ),
      ),
    );
  }
}
