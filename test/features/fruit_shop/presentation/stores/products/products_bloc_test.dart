import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framework_challenge/core/errors/failures.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/product_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/usecases/search_products/search_product_usecase.dart';
import 'package:framework_challenge/features/fruit_shop/presentation/stores/products/products_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'products_bloc_test.mocks.dart';

@GenerateMocks([SearchProductUseCase])
main() {
  late MockSearchProductUseCase mockSearchProductUseCase;
  late ProductsBloc bloc;
  setUp(() {
    mockSearchProductUseCase = MockSearchProductUseCase();
    bloc = ProductsBloc(usecase: mockSearchProductUseCase);
  });
  const tProducts = [
    ProductEntity(
      name: "test",
      description: "desc",
      price: 12.5,
      imageUrl: "imageUrl",
    )
  ];

  const tQuery = "query";
  test("should be the initial state Empty", () async {
    expect(bloc.state, const ProductsState.empty());
  });
  group("SearchProducts", () {
    setUp(() {
      //
    });

    test("should get products from the usecase when successfull", () async {
      when(mockSearchProductUseCase(query: anyNamed("query")))
          .thenAnswer((_) async => const Right(tProducts));

      bloc.add(const ProductsEvent.searchProducts(query: tQuery));

      await untilCalled(mockSearchProductUseCase(query: tQuery));
    });
    test(
        "should emit[Loading, Loaded] with the proper products when the usecase has success",
        () async {
      when(mockSearchProductUseCase(query: anyNamed("query")))
          .thenAnswer((_) async => const Right(tProducts));

      expectLater(
          bloc.stream,
          emitsInOrder([
            const ProductsState.loading(),
            const ProductsState.loaded(products: tProducts)
          ]));
      bloc.add(const ProductsEvent.searchProducts(query: tQuery));
    });
    test("should emit[Loading, Empty] when the products result are empty",
        () async {
      when(mockSearchProductUseCase(query: anyNamed("query")))
          .thenAnswer((_) async => const Right([]));

      expectLater(
          bloc.stream,
          emitsInOrder(
              [const ProductsState.loading(), const ProductsState.empty()]));
      bloc.add(const ProductsEvent.searchProducts(query: tQuery));
    });
    test(
        "should emit[Loading, Error] with the proper message when the usecase fail",
        () async {
      when(mockSearchProductUseCase(query: anyNamed("query")))
          .thenAnswer((_) async => Left(SearchFailure()));

      expectLater(
          bloc.stream,
          emitsInOrder([
            const ProductsState.loading(),
            const ProductsState.error(message: PRODUCTS_SEARCH_FAILURE_MESSAGE)
          ]));
      bloc.add(const ProductsEvent.searchProducts(query: tQuery));
    });
  });
}
