part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.addProduct({
    required ProductEntity product,
  }) = AddProduct;
  const factory CartEvent.removeProduct({
    required CartItemEntity cartProduct,
  }) = RemoveProduct;
  const factory CartEvent.incrementAmmount({
    required CartItemEntity cartProduct,
  }) = IncrementAmmount;
  const factory CartEvent.decrementAmmount({
    required CartItemEntity cartProduct,
  }) = DecrementAmmount;
}
