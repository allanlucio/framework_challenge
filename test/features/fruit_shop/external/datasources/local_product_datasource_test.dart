import 'package:flutter_test/flutter_test.dart';
import 'package:framework_challenge/core/database/database.dart';
import 'package:framework_challenge/core/diacritics/diacritics.dart';
import 'package:framework_challenge/features/fruit_shop/external/datasources/local_product_datasource.dart';
import 'package:framework_challenge/features/fruit_shop/infra/datasources/product_datasource.dart';
import 'package:framework_challenge/features/fruit_shop/infra/models/product_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'local_product_datasource_test.mocks.dart';

@GenerateMocks([Diacritic])
main() {
  late ProductDataSource dataSource;
  late MockDiacritic mockDiacritic;
  setUp(() {
    mockDiacritic = MockDiacritic();
    dataSource = LocalProductDataSource(diacritic: mockDiacritic);
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
      when(mockDiacritic.clean(any)).thenReturn("");
      final result = await dataSource.searchProducts(query: "");
      expect(result, tAllProducts);
    });
    test("should call diacritic.clean two time with input string = ma",
        () async {
      when(mockDiacritic.clean(any)).thenReturn("ma");
      await dataSource.searchProducts(query: "ma");
      verifyInOrder([
        mockDiacritic.clean("ma"),
        mockDiacritic.clean("Manga"),
      ]);
    });
  });
}
