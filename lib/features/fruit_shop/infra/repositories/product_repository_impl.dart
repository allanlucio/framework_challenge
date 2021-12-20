import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource dataSource;

  ProductRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts(
      {required String query}) async {
    try {
      final result = await dataSource.searchProducts(query: query);
      return Right(result);
    } on SearchException {
      return Left(SearchFailure());
    }
  }
}
