import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../stores/products/products_bloc.dart';
import '../products_container.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final ProductsBloc bloc;
  final double _itemHeight = 200;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      bloc: bloc,
      builder: (context, state) {
        return state.maybeWhen(
            loaded: (products) => GridView.builder(
                  itemCount: products.length,
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    mainAxisExtent: _itemHeight,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductContainer(
                      height: _itemHeight,
                      product: product,
                      onClick: (product) => Modular.to
                          .pushNamed("/fruit_shop/product", arguments: product),
                    );
                  },
                ),
            loading: () => Center(child: CircularProgressIndicator()),
            orElse: () => Center(
                child: Text("Nenhum produto encontrado para esta busca.",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ))));
      },
    );
  }
}
