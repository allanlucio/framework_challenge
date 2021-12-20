part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.empty() = Empty;
  const factory ProductsState.loading() = Loading;
  const factory ProductsState.loaded({required List<ProductEntity> products}) =
      Loaded;
  const factory ProductsState.error({required String message}) = Error;
}
