import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/cart_entity.dart';
import '../../../domain/entities/cart_item_entity.dart';
import '../../../domain/entities/product_entity.dart';

part 'cart_bloc.freezed.dart';
part 'cart_event.dart';
part 'cart_state.dart';

const ADD_CART_SUCCESS_MESSAGE = "Produto adicionado com sucesso";
const REMOVE_CART_SUCCESS_MESSAGE = "Produto removido com sucesso";
const REMOVE_CART_FAILURE_MESSAGE = "Produto não encontrado no carrinho";

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState.loaded()) {
    on<AddProduct>(addProduct);
    on<RemoveProduct>(removeProduct);
    on<IncrementAmmount>(incrementAmmount);
    on<DecrementAmmount>(decrementAmmount);
  }

  FutureOr<void> decrementAmmount(event, emit) {
    final items = {...state.cart.items};
    final cartProduct = event.cartProduct;
    if (items.contains(event.cartProduct)) {
      final result = items
          .where((element) => element.product != cartProduct.product)
          .toSet();
      result.add(
        cartProduct.copyWith(
            ammount: cartProduct.ammount <= 1 ? 1 : cartProduct.ammount - 1),
      );

      emit(Loaded(cart: CartEntity(items: result)));
    }
  }

  FutureOr<void> incrementAmmount(event, emit) {
    final items = {...state.cart.items};
    final cartProduct = event.cartProduct;
    if (items.contains(event.cartProduct)) {
      final result = items.where((element) => element != cartProduct).toSet();
      result.add(
        cartProduct.copyWith(ammount: cartProduct.ammount + 1),
      );
      emit(Loaded(cart: CartEntity(items: result)));
    }
  }

  FutureOr<void> removeProduct(event, emit) {
    final items = {...state.cart.items};
    if (items.contains(event.cartProduct)) {
      final result = items
          .where((cartProduct) => cartProduct != event.cartProduct)
          .toSet();

      emit(Loaded(
          cart: CartEntity(items: result),
          message: REMOVE_CART_SUCCESS_MESSAGE));
    } else {
      emit(state.copyWith(message: REMOVE_CART_FAILURE_MESSAGE));
    }
  }

  FutureOr<void> addProduct(event, emit) {
    final items = {...state.cart.items};

    items.add(CartItemEntity(ammount: 1, product: event.product));

    emit(Loaded(
        cart: CartEntity(items: items), message: ADD_CART_SUCCESS_MESSAGE));
  }
}
