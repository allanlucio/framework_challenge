import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../design_system/scaffold/fruit_shop_scaffold.dart';
import '../stores/products/products_bloc.dart';
import '../widgets/products_container.dart';
import '../widgets/search_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, ProductsBloc> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc.add(SearchProducts(query: ""));
  }

  @override
  Widget build(BuildContext context) {
    return FruitShopScaffold(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.08,
          ),
          Expanded(
            child: SearchTextField(
              searchController: _searchController,
              onChanged: (query) => bloc.add(
                SearchProducts(query: query),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          HomeTitle(),
          Expanded(
            child: HomeBody(
              bloc: bloc,
            ),
          )
        ],
      ),
    );
  }
}

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Ofertas do dia",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

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
            orElse: () => Text("Nenhum produto encontrado"));
      },
    );
  }
}
