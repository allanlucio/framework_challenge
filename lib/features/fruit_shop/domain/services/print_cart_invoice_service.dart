import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/cart_entity.dart';

abstract class PrintCartInvoiceService {
  Future<Either<Failure, void>> call({required CartEntity cart});
}
