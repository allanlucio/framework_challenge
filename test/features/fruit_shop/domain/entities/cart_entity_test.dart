import 'package:flutter_test/flutter_test.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/cart_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/cart_item_entity.dart';
import 'package:framework_challenge/features/fruit_shop/domain/entities/product_entity.dart';

main() {
  setUp(() {});
  final tCart = CartEntity(
    items: {
      CartItemEntity(
        ammount: 3,
        product: ProductEntity(
          description: "desc",
          imageUrl: "aa",
          name: "",
          price: 10,
        ),
      ),
      CartItemEntity(
        ammount: 2,
        product: ProductEntity(
          description: "desc",
          imageUrl: "bbb",
          name: "",
          price: 15,
        ),
      ),
    },
  );

  group("total", () {
    setUp(() {
      //
    });

    test("should be the total for the stub cart result equals to 60", () async {
      expect(tCart.total, 60);
    });
  });
}
