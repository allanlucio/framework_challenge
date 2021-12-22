import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../domain/entities/product_entity.dart';
import '../../../domain/usecases/search_products/search_product_usecase.dart';

part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

const _duration = const Duration(milliseconds: 300);

const PRODUCTS_SEARCH_FAILURE_MESSAGE =
    "Não foi possível realizar a busca pelos produtos";

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final SearchProductUseCase usecase;

  ProductsBloc({required this.usecase}) : super(const Empty()) {
    on<SearchProducts>(onSearchProducts, transformer: debounce(_duration));
  }

  FutureOr<void> onSearchProducts(event, emit) async {
    emit(const ProductsState.loading());
    final resultEither = await usecase(query: event.query);
    resultEither.fold(
      (l) => emit(
          const ProductsState.error(message: PRODUCTS_SEARCH_FAILURE_MESSAGE)),
      (products) {
        if (products.isNotEmpty) {
          emit(ProductsState.loaded(products: products));
        } else {
          emit(ProductsState.empty());
        }
      },
    );
  }
}
