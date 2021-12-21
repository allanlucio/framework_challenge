import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/cart_entity.dart';
import '../../../domain/entities/cart_item_entity.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/usecases/search_products/print_cart_invoice_usecase.dart';

part 'cart_bloc.freezed.dart';
part 'cart_event.dart';
part 'cart_state.dart';

const ADD_CART_SUCCESS_MESSAGE = "Produto adicionado com sucesso";
const REMOVE_CART_SUCCESS_MESSAGE = "Produto removido com sucesso";
const REMOVE_CART_FAILURE_MESSAGE = "Produto não encontrado no carrinho";

class CartBloc extends Bloc<CartEvent, CartState> {
  final PrintCartInvoiceUsecase printCartUsecase;
  CartBloc({required this.printCartUsecase}) : super(const CartState.loaded()) {
    on<AddProduct>(addProduct);
    on<RemoveProduct>(removeProduct);
    on<IncrementAmmount>(incrementAmmount);
    on<DecrementAmmount>(decrementAmmount);
    on<Checkout>(checkout);
  }

  FutureOr<void> addProduct(AddProduct event, emit) {
    final items = {...state.cart.items};

    items.add(CartItemEntity(ammount: 1, product: event.product));

    emit(Loaded(
        cart: CartEntity(items: sort(items)),
        message: ADD_CART_SUCCESS_MESSAGE));
  }

  FutureOr<void> removeProduct(RemoveProduct event, emit) {
    final items = {...state.cart.items};
    if (items.contains(event.cartProduct)) {
      items.remove(event.cartProduct);
      emit(Loaded(
          cart: CartEntity(items: items),
          message: REMOVE_CART_SUCCESS_MESSAGE));
    } else {
      emit(state.copyWith(message: REMOVE_CART_FAILURE_MESSAGE));
    }
  }

  FutureOr<void> incrementAmmount(IncrementAmmount event, emit) {
    final items = {...state.cart.items};
    final cartProduct = event.cartProduct;
    if (items.contains(event.cartProduct)) {
      final result = items.where((element) => element != cartProduct).toSet();
      result.add(
        cartProduct.copyWith(ammount: cartProduct.ammount + 1),
      );

      emit(Loaded(cart: CartEntity(items: sort(result))));
    }
  }

  FutureOr<void> decrementAmmount(DecrementAmmount event, emit) {
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

      emit(Loaded(cart: CartEntity(items: sort(result))));
    }
  }

  FutureOr<void> checkout(Checkout event, emit) async {
    await printCartUsecase(cart: event.cartEntity);
  }

  Set<CartItemEntity> sort(Set<CartItemEntity> items) {
    return SplayTreeSet.from(
      items,
      (CartItemEntity a, CartItemEntity b) =>
          a.product.name.compareTo(b.product.name),
    );
  }
}
