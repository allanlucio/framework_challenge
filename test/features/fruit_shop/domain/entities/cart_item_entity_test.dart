import 'package:flutter_test/flutter_test.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/cart_item_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/product_entity.dart';

main() {
  setUp(() {});
  final tManga = ProductEntity(
    name: "manga",
    description: "desc",
    price: 12.5,
    imageUrl: "imageUrl",
  );
  final tCartItemEntity = CartItemEntity(ammount: 1, product: tManga);

  group("incremmentAmmount", () {
    setUp(() {
      //
    });

    test("should add the ammount by one when called", () async {
      expect(tCartItemEntity.ammount, 1);
      tCartItemEntity.incremmentAmmount();
      expect(tCartItemEntity.ammount, 2);
      tCartItemEntity.incremmentAmmount();
      expect(tCartItemEntity.ammount, 3);
    });
  });
  group("decremmentAmmount", () {
    late CartItemEntity tCartItem;
    setUp(() {
      tCartItem = CartItemEntity(ammount: 3, product: tManga);
    });

    test("should decrement the ammount by one when called", () async {
      expect(tCartItem.ammount, 3);
      tCartItem.decremmentAmmount();
      expect(tCartItem.ammount, 2);
    });
    test(
        "shouldnt decrement but when the ammount is one it shouldn be decrement anymore",
        () async {
      expect(tCartItem.ammount, 3);
      tCartItem.decremmentAmmount();
      expect(tCartItem.ammount, 2);
      tCartItem.decremmentAmmount();
      expect(tCartItem.ammount, 1);
      tCartItem.decremmentAmmount();
      expect(tCartItem.ammount, 1);
    });
  });
}
