import '../../../../core/database/database.dart';
import '../../../../core/diacritics/diacritics.dart';
import '../../../../core/errors/exceptions.dart';
import '../../infra/datasources/product_datasource.dart';
import '../../infra/models/product_model.dart';

class LocalProductDataSource implements ProductDataSource {
  final Diacritic diacritic;

  LocalProductDataSource({required this.diacritic});
  @override
  Future<List<ProductModel>> searchProducts({required String query}) {
    final cleanedQuery = this.diacritic.clean(query);
    try {
      final products = productsDatabase()
          .map((json) => ProductModel.fromJson(json))
          .toList();
      final result = products.where((element) =>
          this.diacritic.clean(element.name).contains(cleanedQuery));
      return Future.delayed(
        const Duration(milliseconds: 500),
        () => result.toList(),
      );
    } on Exception {
      throw SearchException();
    }
  }
}
