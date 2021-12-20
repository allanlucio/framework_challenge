part of 'cart_bloc.dart';

const defaultCart = CartEntity(items: {});

@freezed
class CartState with _$CartState {
  const factory CartState.loaded(
      {@Default(defaultCart) CartEntity cart, String? message}) = Loaded;
}
