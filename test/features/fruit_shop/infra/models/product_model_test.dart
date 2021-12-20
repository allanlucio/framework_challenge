import 'package:flutter_test/flutter_test.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/product_entity.dart';
import 'package:framework_challenge/features/fruit_shop/infra/models/product_model.dart';

import '../../../../fixtures/fixture_reader.dart';

main() {
  const tProduct = ProductModel(
      name: "Melão",
      description: "o melão é amarelo e redondo",
      price: 5.50,
      imageUrl: "http://image.com");
  setUp(() {});

  test("should productModel be subtype of ProductEntity", () async {
    expect(tProduct, isA<ProductEntity>());
  });

  group("fromJson", () {
    setUp(() {
      //
    });

    test("should create an instance of ProductModel from a proper json",
        () async {
      final tProductModel =
          ProductModel.fromJson(fixtureAsJson("product/product.json"));
      expect(tProductModel, tProduct);
    });
  });
}
