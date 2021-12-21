import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/cart_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/cart_item_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/product_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/services/print_cart_invoice_service.dart';
import 'package:framework_challenge/features/fruit_shop/domain/usecases/search_products/print_cart_invoice_usecase.dart';
import 'package:framework_challenge/features/fruit_shop/domain/usecases/search_products/print_cart_invoice_usecase_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'print_cart_invoice_usecase_impl_test.mocks.dart';

@GenerateMocks([PrintCartInvoiceService])
main() {
  late MockPrintCartInvoiceService mockPrintCartInvoiceService;
  late PrintCartInvoiceUsecase usecase;

  setUp(() {
    mockPrintCartInvoiceService = MockPrintCartInvoiceService();
    usecase = PrintCartInvoiceUsecaseImpl(service: mockPrintCartInvoiceService);
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
  test("should call the service with proper params when sucessful", () async {
    when(mockPrintCartInvoiceService(cart: anyNamed("cart")))
        .thenAnswer((_) async => Right(tCart));

    await usecase(cart: tCart);
    verify(mockPrintCartInvoiceService(cart: tCart));
  });
}
