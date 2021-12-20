import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/product_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/repositories/product_repository.dart';
import 'package:framework_challenge/features/fruit_shop/domain/usecases/search_products/search_product_usecase.dart';
import 'package:framework_challenge/features/fruit_shop/domain/usecases/search_products/search_product_usecase_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_product_usecase_impl_test.mocks.dart';

@GenerateMocks([ProductRepository])
main() {
  late MockProductRepository mockProductRepository;
  late SearchProductUseCase usecase;
  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = SearchProductUseCaseImpl(repository: mockProductRepository);
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
  test(
      "should call the repository with the proper query param when the usecase is called",
      () async {
    when(mockProductRepository.searchProducts(query: anyNamed("query")))
        .thenAnswer((_) async => const Right(tProducts));
    usecase(query: tQuery);
    verify(mockProductRepository.searchProducts(query: tQuery));
  });
  test("should return the value retrieved from the repository when successfull",
      () async {
    when(mockProductRepository.searchProducts(query: anyNamed("query")))
        .thenAnswer((_) async => const Right(tProducts));
    final result = await usecase(query: tQuery);

    expect(result, const Right(tProducts));
  });
}
