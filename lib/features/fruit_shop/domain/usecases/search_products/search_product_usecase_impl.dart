import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../entities/product_entity.dart';
import '../../repositories/product_repository.dart';
import 'search_product_usecase.dart';

class SearchProductUseCaseImpl implements SearchProductUseCase {
  final ProductRepository repository;

  SearchProductUseCaseImpl({required this.repository});
  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      {required String query}) async {
    return await repository.searchProducts(query: query);
  }
}
