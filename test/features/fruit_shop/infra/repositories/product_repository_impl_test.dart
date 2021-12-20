import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framework_challenge/core/errors/exceptions.dart';
import 'package:framework_challenge/core/errors/failures.dart';
import 'package:framework_challenge/features/fruit_shop/domain/repositories/product_repository.dart';
import 'package:framework_challenge/features/fruit_shop/infra/datasources/product_datasource.dart';
import 'package:framework_challenge/features/fruit_shop/infra/models/product_model.dart';
import 'package:framework_challenge/features/fruit_shop/infra/repositories/product_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'product_repository_impl_test.mocks.dart';

@GenerateMocks([ProductDataSource])
main() {
  late MockProductDataSource mockProductDataSource;
  late ProductRepository repository;
  setUp(() {
    mockProductDataSource = MockProductDataSource();
    repository = ProductRepositoryImpl(
      dataSource: mockProductDataSource,
    );
  });

  final tProductsModel = [
    ProductModel.fromJson(fixtureAsJson("product/product.json"))
  ];
  const tQuery = "query";

  group("searchProducts", () {
    setUp(() {
      //
    });

    test(
        "should retrieve a list of productModel from the datasource when sucessfull and return a list of productEntity",
        () async {
      when(mockProductDataSource.searchProducts(query: anyNamed("query")))
          .thenAnswer((_) async => tProductsModel);

      final result = await repository.searchProducts(query: tQuery);

      expect(result, Right(tProductsModel));
      verify(mockProductDataSource.searchProducts(query: tQuery));
    });
    test(
        "should return a SearchFailure when the datasource throws a SearchException",
        () async {
      when(mockProductDataSource.searchProducts(query: anyNamed("query")))
          .thenThrow(SearchException());

      final result = await repository.searchProducts(query: tQuery);

      expect(result, Left(SearchFailure()));
      verify(mockProductDataSource.searchProducts(query: tQuery));
    });
  });
}
