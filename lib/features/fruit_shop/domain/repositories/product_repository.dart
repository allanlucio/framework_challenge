import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> searchProducts(
      {required String query});
}
