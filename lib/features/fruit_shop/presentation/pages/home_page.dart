import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../design_system/scaffold/fruit_shop_scaffold.dart';
import '../stores/products/products_bloc.dart';
import '../widgets/home_page/home_body.dart';
import '../widgets/home_page/home_title.dart';
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
