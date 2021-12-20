import 'package:flutter_test/flutter_test.dart';
import 'package:framework_challenge/core/database/database.dart';
import 'package:framework_challenge/features/fruit_shop/external/datasources/local_product_datasource.dart';
import 'package:framework_challenge/features/fruit_shop/infra/datasources/product_datasource.dart';
import 'package:framework_challenge/features/fruit_shop/infra/models/product_model.dart';

main() {
  late ProductDataSource dataSource;
  setUp(() {
    dataSource = LocalProductDataSource();
  });

  group("searchProducts", () {
    final tAllProducts =
        productsDatabase().map((json) => ProductModel.fromJson(json)).toList();
    setUp(() {
      //
    });

    test(
        "should return all the fruits retrieved from the json local database when query with an empty string",
        () async {
      final result = await dataSource.searchProducts(query: "");
      expect(result, tAllProducts);
    });
    test("should return [Maçã, Manga] when the query=ma", () async {
      final result = await dataSource.searchProducts(query: "ma");
      expect(
          result,
          tAllProducts
              .where((element) => element.name.toLowerCase().contains("ma")));
    });
    test("should return an empty list when the query== nonexist", () async {
      final result = await dataSource.searchProducts(query: "nonexist");
      expect(result, []);
    });
  });
}
