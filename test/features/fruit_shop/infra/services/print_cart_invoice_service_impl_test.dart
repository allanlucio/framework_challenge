import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framework_challenge/core/errors/exceptions.dart';
import 'package:framework_challenge/core/errors/failures.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/cart_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/cart_item_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/product_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/services/print_cart_invoice_service.dart';
import 'package:framework_challenge/features/fruit_shop/infra/datasources/print_cart_invoice_data_source.dart';
import 'package:framework_challenge/features/fruit_shop/infra/models/cart_model.dart';
import 'package:framework_challenge/features/fruit_shop/infra/services/print_cart_invoice_service_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'print_cart_invoice_service_impl_test.mocks.dart';

@GenerateMocks([CartInvoiceDataSource])
main() {
  late MockCartInvoiceDataSource mockCartInvoiceDataSource;
  late PrintCartInvoiceService service;
  setUp(() {
    mockCartInvoiceDataSource = MockCartInvoiceDataSource();
    service =
        PrintCartInvoiceServiceImpl(dataSource: mockCartInvoiceDataSource);
  });
  final tCart = CartEntity(
    items: {
      CartItemEntity(
        ammount: 1,
        product: ProductEntity(
            description: "desc", imageUrl: "aa", name: "", price: 12.2),
      ),
    },
  );

  test("should call the service with the proper CartModel", () async {
    when(mockCartInvoiceDataSource(cart: anyNamed("cart")))
        .thenAnswer((_) async => null);

    await service(cart: tCart);
    verify(mockCartInvoiceDataSource(cart: CartModel.fromEntity(tCart)));
  });
  test("should return a PrintFailure when the datasource throws an exception",
      () async {
    when(mockCartInvoiceDataSource(cart: anyNamed("cart")))
        .thenThrow(PrintException());

    final result = await service(cart: tCart);
    expect(result, Left(PrintFailure()));
  });
}
