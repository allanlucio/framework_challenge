import '../../../../core/database/database.dart';
import '../../../../core/errors/exceptions.dart';
import '../../infra/datasources/product_datasource.dart';
import '../../infra/models/product_model.dart';

class LocalProductDataSource implements ProductDataSource {
  @override
  Future<List<ProductModel>> searchProducts({required String query}) {
    try {
      final products = productsDatabase()
          .map((json) => ProductModel.fromJson(json))
          .toList();
      final result = products
          .where((element) => element.name.toLowerCase().contains(query));
      return Future.delayed(
        const Duration(milliseconds: 200),
        () => result.toList(),
      );
    } on Exception {
      throw SearchException();
    }
  }
}
