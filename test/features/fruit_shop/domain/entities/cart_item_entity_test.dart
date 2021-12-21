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
  final tCartItemEntity = CartItemEntity(ammount: 2, product: tManga);

  test(
      "should be the total equal to 25 when the price is 12.5 and the ammount is 2",
      () async {
    expect(tCartItemEntity.total, 25);
  });
}
