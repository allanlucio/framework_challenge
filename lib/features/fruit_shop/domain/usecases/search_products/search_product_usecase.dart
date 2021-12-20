import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../entities/product_entity.dart';

abstract class SearchProductUseCase {
  Future<Either<Failure, List<ProductEntity>>> call({required String query});
}
