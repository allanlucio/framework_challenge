// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CartEventTearOff {
  const _$CartEventTearOff();

  AddProduct addProduct({required ProductEntity product}) {
    return AddProduct(
      product: product,
    );
  }

  RemoveProduct removeProduct({required CartItemEntity cartProduct}) {
    return RemoveProduct(
      cartProduct: cartProduct,
    );
  }

  IncrementAmmount incrementAmmount({required CartItemEntity cartProduct}) {
    return IncrementAmmount(
      cartProduct: cartProduct,
    );
  }

  DecrementAmmount decrementAmmount({required CartItemEntity cartProduct}) {
    return DecrementAmmount(
      cartProduct: cartProduct,
    );
  }
}

/// @nodoc
const $CartEvent = _$CartEventTearOff();

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductEntity product) addProduct,
    required TResult Function(CartItemEntity cartProduct) removeProduct,
    required TResult Function(CartItemEntity cartProduct) incrementAmmount,
    required TResult Function(CartItemEntity cartProduct) decrementAmmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ProductEntity product)? addProduct,
    TResult Function(CartItemEntity cartProduct)? removeProduct,
    TResult Function(CartItemEntity cartProduct)? incrementAmmount,
    TResult Function(CartItemEntity cartProduct)? decrementAmmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductEntity product)? addProduct,
    TResult Function(CartItemEntity cartProduct)? removeProduct,
    TResult Function(CartItemEntity cartProduct)? incrementAmmount,
    TResult Function(CartItemEntity cartProduct)? decrementAmmount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(IncrementAmmount value) incrementAmmount,
    required TResult Function(DecrementAmmount value) decrementAmmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(IncrementAmmount value)? incrementAmmount,
    TResult Function(DecrementAmmount value)? decrementAmmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(IncrementAmmount value)? incrementAmmount,
    TResult Function(DecrementAmmount value)? decrementAmmount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res> implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  final CartEvent _value;
  // ignore: unused_field
  final $Res Function(CartEvent) _then;
}

/// @nodoc
abstract class $AddProductCopyWith<$Res> {
  factory $AddProductCopyWith(
          AddProduct value, $Res Function(AddProduct) then) =
      _$AddProductCopyWithImpl<$Res>;
  $Res call({ProductEntity product});
}

/// @nodoc
class _$AddProductCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements $AddProductCopyWith<$Res> {
  _$AddProductCopyWithImpl(AddProduct _value, $Res Function(AddProduct) _then)
      : super(_value, (v) => _then(v as AddProduct));

  @override
  AddProduct get _value => super._value as AddProduct;

  @override
  $Res call({
    Object? product = freezed,
  }) {
    return _then(AddProduct(
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductEntity,
    ));
  }
}

/// @nodoc

class _$AddProduct implements AddProduct {
  const _$AddProduct({required this.product});

  @override
  final ProductEntity product;

  @override
  String toString() {
    return 'CartEvent.addProduct(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddProduct &&
            (identical(other.product, product) ||
                const DeepCollectionEquality().equals(other.product, product)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(product);

  @JsonKey(ignore: true)
  @override
  $AddProductCopyWith<AddProduct> get copyWith =>
      _$AddProductCopyWithImpl<AddProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductEntity product) addProduct,
    required TResult Function(CartItemEntity cartProduct) removeProduct,
    required TResult Function(CartItemEntity cartProduct) incrementAmmount,
    required TResult Function(CartItemEntity cartProduct) decrementAmmount,
  }) {
    return addProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ProductEntity product)? addProduct,
    TResult Function(CartItemEntity cartProduct)? removeProduct,
    TResult Function(CartItemEntity cartProduct)? incrementAmmount,
    TResult Function(CartItemEntity cartProduct)? decrementAmmount,
  }) {
    return addProduct?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductEntity product)? addProduct,
    TResult Function(CartItemEntity cartProduct)? removeProduct,
    TResult Function(CartItemEntity cartProduct)? incrementAmmount,
    TResult Function(CartItemEntity cartProduct)? decrementAmmount,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(IncrementAmmount value) incrementAmmount,
    required TResult Function(DecrementAmmount value) decrementAmmount,
  }) {
    return addProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(IncrementAmmount value)? incrementAmmount,
    TResult Function(DecrementAmmount value)? decrementAmmount,
  }) {
    return addProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(IncrementAmmount value)? incrementAmmount,
    TResult Function(DecrementAmmount value)? decrementAmmount,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(this);
    }
    return orElse();
  }
}

abstract class AddProduct implements CartEvent {
  const factory AddProduct({required ProductEntity product}) = _$AddProduct;

  ProductEntity get product => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddProductCopyWith<AddProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveProductCopyWith<$Res> {
  factory $RemoveProductCopyWith(
          RemoveProduct value, $Res Function(RemoveProduct) then) =
      _$RemoveProductCopyWithImpl<$Res>;
  $Res call({CartItemEntity cartProduct});
}

/// @nodoc
class _$RemoveProductCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements $RemoveProductCopyWith<$Res> {
  _$RemoveProductCopyWithImpl(
      RemoveProduct _value, $Res Function(RemoveProduct) _then)
      : super(_value, (v) => _then(v as RemoveProduct));

  @override
  RemoveProduct get _value => super._value as RemoveProduct;

  @override
  $Res call({
    Object? cartProduct = freezed,
  }) {
    return _then(RemoveProduct(
      cartProduct: cartProduct == freezed
          ? _value.cartProduct
          : cartProduct // ignore: cast_nullable_to_non_nullable
              as CartItemEntity,
    ));
  }
}

/// @nodoc

class _$RemoveProduct implements RemoveProduct {
  const _$RemoveProduct({required this.cartProduct});

  @override
  final CartItemEntity cartProduct;

  @override
  String toString() {
    return 'CartEvent.removeProduct(cartProduct: $cartProduct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RemoveProduct &&
            (identical(other.cartProduct, cartProduct) ||
                const DeepCollectionEquality()
                    .equals(other.cartProduct, cartProduct)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cartProduct);

  @JsonKey(ignore: true)
  @override
  $RemoveProductCopyWith<RemoveProduct> get copyWith =>
      _$RemoveProductCopyWithImpl<RemoveProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductEntity product) addProduct,
    required TResult Function(CartItemEntity cartProduct) removeProduct,
    required TResult Function(CartItemEntity cartProduct) incrementAmmount,
    required TResult Function(CartItemEntity cartProduct) decrementAmmount,
  }) {
    return removeProduct(cartProduct);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ProductEntity product)? addProduct,
    TResult Function(CartItemEntity cartProduct)? removeProduct,
    TResult Function(CartItemEntity cartProduct)? incrementAmmount,
    TResult Function(CartItemEntity cartProduct)? decrementAmmount,
  }) {
    return removeProduct?.call(cartProduct);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductEntity product)? addProduct,
    TResult Function(CartItemEntity cartProduct)? removeProduct,
    TResult Function(CartItemEntity cartProduct)? incrementAmmount,
    TResult Function(CartItemEntity cartProduct)? decrementAmmount,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(cartProduct);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(IncrementAmmount value) incrementAmmount,
    required TResult Function(DecrementAmmount value) decrementAmmount,
  }) {
    return removeProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(IncrementAmmount value)? incrementAmmount,
    TResult Function(DecrementAmmount value)? decrementAmmount,
  }) {
    return removeProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(IncrementAmmount value)? incrementAmmount,
    TResult Function(DecrementAmmount value)? decrementAmmount,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(this);
    }
    return orElse();
  }
}

abstract class RemoveProduct implements CartEvent {
  const factory RemoveProduct({required CartItemEntity cartProduct}) =
      _$RemoveProduct;

  CartItemEntity get cartProduct => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoveProductCopyWith<RemoveProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncrementAmmountCopyWith<$Res> {
  factory $IncrementAmmountCopyWith(
          IncrementAmmount value, $Res Function(IncrementAmmount) then) =
      _$IncrementAmmountCopyWithImpl<$Res>;
  $Res call({CartItemEntity cartProduct});
}

/// @nodoc
class _$IncrementAmmountCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements $IncrementAmmountCopyWith<$Res> {
  _$IncrementAmmountCopyWithImpl(
      IncrementAmmount _value, $Res Function(IncrementAmmount) _then)
      : super(_value, (v) => _then(v as IncrementAmmount));

  @override
  IncrementAmmount get _value => super._value as IncrementAmmount;

  @override
  $Res call({
    Object? cartProduct = freezed,
  }) {
    return _then(IncrementAmmount(
      cartProduct: cartProduct == freezed
          ? _value.cartProduct
          : cartProduct // ignore: cast_nullable_to_non_nullable
              as CartItemEntity,
    ));
  }
}

/// @nodoc

class _$IncrementAmmount implements IncrementAmmount {
  const _$IncrementAmmount({required this.cartProduct});

  @override
  final CartItemEntity cartProduct;

  @override
  String toString() {
    return 'CartEvent.incrementAmmount(cartProduct: $cartProduct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IncrementAmmount &&
            (identical(other.cartProduct, cartProduct) ||
                const DeepCollectionEquality()
                    .equals(other.cartProduct, cartProduct)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cartProduct);

  @JsonKey(ignore: true)
  @override
  $IncrementAmmountCopyWith<IncrementAmmount> get copyWith =>
      _$IncrementAmmountCopyWithImpl<IncrementAmmount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductEntity product) addProduct,
    required TResult Function(CartItemEntity cartProduct) removeProduct,
    required TResult Function(CartItemEntity cartProduct) incrementAmmount,
    required TResult Function(CartItemEntity cartProduct) decrementAmmount,
  }) {
    return incrementAmmount(cartProduct);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ProductEntity product)? addProduct,
    TResult Function(CartItemEntity cartProduct)? removeProduct,
    TResult Function(CartItemEntity cartProduct)? incrementAmmount,
    TResult Function(CartItemEntity cartProduct)? decrementAmmount,
  }) {
    return incrementAmmount?.call(cartProduct);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductEntity product)? addProduct,
    TResult Function(CartItemEntity cartProduct)? removeProduct,
    TResult Function(CartItemEntity cartProduct)? incrementAmmount,
    TResult Function(CartItemEntity cartProduct)? decrementAmmount,
    required TResult orElse(),
  }) {
    if (incrementAmmount != null) {
      return incrementAmmount(cartProduct);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(IncrementAmmount value) incrementAmmount,
    required TResult Function(DecrementAmmount value) decrementAmmount,
  }) {
    return incrementAmmount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(IncrementAmmount value)? incrementAmmount,
    TResult Function(DecrementAmmount value)? decrementAmmount,
  }) {
    return incrementAmmount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(IncrementAmmount value)? incrementAmmount,
    TResult Function(DecrementAmmount value)? decrementAmmount,
    required TResult orElse(),
  }) {
    if (incrementAmmount != null) {
      return incrementAmmount(this);
    }
    return orElse();
  }
}

abstract class IncrementAmmount implements CartEvent {
  const factory IncrementAmmount({required CartItemEntity cartProduct}) =
      _$IncrementAmmount;

  CartItemEntity get cartProduct => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncrementAmmountCopyWith<IncrementAmmount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DecrementAmmountCopyWith<$Res> {
  factory $DecrementAmmountCopyWith(
          DecrementAmmount value, $Res Function(DecrementAmmount) then) =
      _$DecrementAmmountCopyWithImpl<$Res>;
  $Res call({CartItemEntity cartProduct});
}

/// @nodoc
class _$DecrementAmmountCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements $DecrementAmmountCopyWith<$Res> {
  _$DecrementAmmountCopyWithImpl(
      DecrementAmmount _value, $Res Function(DecrementAmmount) _then)
      : super(_value, (v) => _then(v as DecrementAmmount));

  @override
  DecrementAmmount get _value => super._value as DecrementAmmount;

  @override
  $Res call({
    Object? cartProduct = freezed,
  }) {
    return _then(DecrementAmmount(
      cartProduct: cartProduct == freezed
          ? _value.cartProduct
          : cartProduct // ignore: cast_nullable_to_non_nullable
              as CartItemEntity,
    ));
  }
}

/// @nodoc

class _$DecrementAmmount implements DecrementAmmount {
  const _$DecrementAmmount({required this.cartProduct});

  @override
  final CartItemEntity cartProduct;

  @override
  String toString() {
    return 'CartEvent.decrementAmmount(cartProduct: $cartProduct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DecrementAmmount &&
            (identical(other.cartProduct, cartProduct) ||
                const DeepCollectionEquality()
                    .equals(other.cartProduct, cartProduct)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cartProduct);

  @JsonKey(ignore: true)
  @override
  $DecrementAmmountCopyWith<DecrementAmmount> get copyWith =>
      _$DecrementAmmountCopyWithImpl<DecrementAmmount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductEntity product) addProduct,
    required TResult Function(CartItemEntity cartProduct) removeProduct,
    required TResult Function(CartItemEntity cartProduct) incrementAmmount,
    required TResult Function(CartItemEntity cartProduct) decrementAmmount,
  }) {
    return decrementAmmount(cartProduct);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ProductEntity product)? addProduct,
    TResult Function(CartItemEntity cartProduct)? removeProduct,
    TResult Function(CartItemEntity cartProduct)? incrementAmmount,
    TResult Function(CartItemEntity cartProduct)? decrementAmmount,
  }) {
    return decrementAmmount?.call(cartProduct);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductEntity product)? addProduct,
    TResult Function(CartItemEntity cartProduct)? removeProduct,
    TResult Function(CartItemEntity cartProduct)? incrementAmmount,
    TResult Function(CartItemEntity cartProduct)? decrementAmmount,
    required TResult orElse(),
  }) {
    if (decrementAmmount != null) {
      return decrementAmmount(cartProduct);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(IncrementAmmount value) incrementAmmount,
    required TResult Function(DecrementAmmount value) decrementAmmount,
  }) {
    return decrementAmmount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(IncrementAmmount value)? incrementAmmount,
    TResult Function(DecrementAmmount value)? decrementAmmount,
  }) {
    return decrementAmmount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(IncrementAmmount value)? incrementAmmount,
    TResult Function(DecrementAmmount value)? decrementAmmount,
    required TResult orElse(),
  }) {
    if (decrementAmmount != null) {
      return decrementAmmount(this);
    }
    return orElse();
  }
}

abstract class DecrementAmmount implements CartEvent {
  const factory DecrementAmmount({required CartItemEntity cartProduct}) =
      _$DecrementAmmount;

  CartItemEntity get cartProduct => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DecrementAmmountCopyWith<DecrementAmmount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CartStateTearOff {
  const _$CartStateTearOff();

  Loaded loaded({CartEntity cart = defaultCart, String? message}) {
    return Loaded(
      cart: cart,
      message: message,
    );
  }
}

/// @nodoc
const $CartState = _$CartStateTearOff();

/// @nodoc
mixin _$CartState {
  CartEntity get cart => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartEntity cart, String? message) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CartEntity cart, String? message)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartEntity cart, String? message)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res>;
  $Res call({CartEntity cart, String? message});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res> implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  final CartState _value;
  // ignore: unused_field
  final $Res Function(CartState) _then;

  @override
  $Res call({
    Object? cart = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      cart: cart == freezed
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as CartEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class $LoadedCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  @override
  $Res call({CartEntity cart, String? message});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> extends _$CartStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object? cart = freezed,
    Object? message = freezed,
  }) {
    return _then(Loaded(
      cart: cart == freezed
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as CartEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Loaded implements Loaded {
  const _$Loaded({this.cart = defaultCart, this.message});

  @JsonKey(defaultValue: defaultCart)
  @override
  final CartEntity cart;
  @override
  final String? message;

  @override
  String toString() {
    return 'CartState.loaded(cart: $cart, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded &&
            (identical(other.cart, cart) ||
                const DeepCollectionEquality().equals(other.cart, cart)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(cart) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartEntity cart, String? message) loaded,
  }) {
    return loaded(cart, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CartEntity cart, String? message)? loaded,
  }) {
    return loaded?.call(cart, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartEntity cart, String? message)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(cart, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements CartState {
  const factory Loaded({CartEntity cart, String? message}) = _$Loaded;

  @override
  CartEntity get cart => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $LoadedCopyWith<Loaded> get copyWith => throw _privateConstructorUsedError;
}
