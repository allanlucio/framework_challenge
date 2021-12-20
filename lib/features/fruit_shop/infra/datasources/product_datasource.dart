import '../models/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> searchProducts({required String query});
}
