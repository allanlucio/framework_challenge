import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/cart_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/cart_item_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/product_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/usecases/search_products/print_cart_invoice_usecase.dart';
import 'package:framework_challenge/features/fruit_shop/presentation/stores/cart/cart_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_bloc_test.mocks.dart';

@GenerateMocks([PrintCartInvoiceUsecase])
main() {
  late CartBloc bloc;
  late MockPrintCartInvoiceUsecase mockPrintCartInvoiceUsecase;
  setUp(() {
    mockPrintCartInvoiceUsecase = MockPrintCartInvoiceUsecase();
    bloc = CartBloc(printCartUsecase: mockPrintCartInvoiceUsecase);
  });
  test("should be the initial state Loaded with the cart empty", () async {
    expect(bloc.state, isA<Loaded>());
    final currentState = bloc.state;
    if (currentState is Loaded) {
      expect(currentState.cart.items, isEmpty);
      expect(currentState.message, null);
    }
  });

  const tManga = ProductEntity(
    name: "manga",
    description: "desc",
    price: 12.5,
    imageUrl: "imageUrl",
  );
  const tPera = ProductEntity(
    name: "pera",
    description: "desc",
    price: 10.5,
    imageUrl: "imageUrl",
  );
  final tCartItemManga = CartItemEntity(ammount: 1, product: tManga);
  final tCartItemPera = CartItemEntity(ammount: 1, product: tPera);
  final tCartItemMangaWithAmmountTwo =
      CartItemEntity(ammount: 2, product: tManga);
  group("AddProduct", () {
    setUp(() {
      //
    });

    test(
        "should emit[Loaded] with the proper product when the product is added",
        () async {
      final expected = [
        Loaded(
          cart: CartEntity(items: {tCartItemManga}),
          message: ADD_CART_SUCCESS_MESSAGE,
        )
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const CartEvent.addProduct(product: tManga));
    });
    test(
        "should emit[Loaded] without duplicate the product when a repeated product is added",
        () async {
      final expected = [
        Loaded(
          cart: CartEntity(items: {tCartItemManga}),
          message: ADD_CART_SUCCESS_MESSAGE,
        )
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const CartEvent.addProduct(product: tManga));
      bloc.add(const CartEvent.addProduct(product: tManga));
    });
    test(
        "should emit[Loaded] all the added products when more than one different product is added",
        () async {
      final expected = [
        Loaded(
          cart: CartEntity(items: {tCartItemManga}),
          message: ADD_CART_SUCCESS_MESSAGE,
        ),
        Loaded(
          cart: CartEntity(items: {
            tCartItemManga,
            tCartItemPera,
          }),
          message: ADD_CART_SUCCESS_MESSAGE,
        )
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const CartEvent.addProduct(product: tManga));
      bloc.add(const CartEvent.addProduct(product: tPera));
    });
  });

  group("RemoveProduct", () {
    setUp(() {
      //
    });

    test("should remove the product when exists", () async {
      final expected = [
        Loaded(
            cart: CartEntity(items: {tCartItemManga}),
            message: ADD_CART_SUCCESS_MESSAGE),
        const Loaded(
          cart: CartEntity(items: {}),
          message: REMOVE_CART_SUCCESS_MESSAGE,
        )
      ];

      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const AddProduct(product: tManga));
      bloc.add(RemoveProduct(cartProduct: tCartItemManga));
    });
    test(
        "shouldnt remove the product when it doesnt exist and show the proper message",
        () async {
      final expected = [
        Loaded(
            cart: CartEntity(items: {tCartItemManga}),
            message: ADD_CART_SUCCESS_MESSAGE),
        Loaded(
          cart: CartEntity(items: {tCartItemManga}),
          message: REMOVE_CART_FAILURE_MESSAGE,
        )
      ];

      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const AddProduct(product: tManga));
      bloc.add(RemoveProduct(cartProduct: tCartItemPera));
    });
  });

  group("IncrementAmmount", () {
    setUp(() {
      //
    });

    test(
        "should increment the ammount of the product item by 1 when dispatched",
        () async {
      final expected = [
        Loaded(
            cart: CartEntity(items: {tCartItemManga}),
            message: ADD_CART_SUCCESS_MESSAGE),
        Loaded(
          cart:
              CartEntity(items: {CartItemEntity(ammount: 2, product: tManga)}),
        )
      ];

      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const AddProduct(product: tManga));
      bloc.add(IncrementAmmount(cartProduct: tCartItemManga));
    });
  });
  group("DecrementAmmount", () {
    setUp(() {
      //
    });

    test("shouldnt decrement the ammount when the ammount is 1", () async {
      final expected = [
        Loaded(
            cart: CartEntity(items: {tCartItemManga}),
            message: ADD_CART_SUCCESS_MESSAGE),
        Loaded(
          cart: CartEntity(items: {tCartItemManga}),
        )
      ];

      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const AddProduct(product: tManga));
      bloc.add(DecrementAmmount(cartProduct: tCartItemManga));
    });
    test("should decrement the ammount by 1 when the ammount is higher than 1",
        () async {
      final expected = [
        Loaded(
            cart: CartEntity(items: {tCartItemManga}),
            message: ADD_CART_SUCCESS_MESSAGE),
        Loaded(
          cart: CartEntity(items: {tCartItemMangaWithAmmountTwo}),
        ),
        Loaded(
          cart: CartEntity(items: {tCartItemManga}),
        )
      ];

      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const AddProduct(product: tManga));
      bloc.add(IncrementAmmount(cartProduct: tCartItemManga));
      bloc.add(DecrementAmmount(cartProduct: tCartItemMangaWithAmmountTwo));
    });
  });

  group("checkout", () {
    setUp(() {
      //
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

    test("should call the printUsecase with the proper cart when called",
        () async {
      when(mockPrintCartInvoiceUsecase(cart: anyNamed("cart"))).thenAnswer(
        (_) async => Right(null),
      );
      bloc.add(Checkout(cartEntity: tCart));
      await untilCalled(mockPrintCartInvoiceUsecase(cart: tCart));
    });
  });
}
