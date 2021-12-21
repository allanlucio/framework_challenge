import '../models/cart_model.dart';

abstract class CartInvoiceDataSource {
  Future<void> call({required CartModel cart});
}
