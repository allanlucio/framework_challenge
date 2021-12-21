import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/services/print_cart_invoice_service.dart';
import '../datasources/print_cart_invoice_data_source.dart';
import '../models/cart_model.dart';

class PrintCartInvoiceServiceImpl implements PrintCartInvoiceService {
  final CartInvoiceDataSource dataSource;

  PrintCartInvoiceServiceImpl({required this.dataSource});
  @override
  Future<Either<Failure, void>> call({required CartEntity cart}) async {
    try {
      return Right(await dataSource(cart: CartModel.fromEntity(cart)));
    } on PrintException {
      return Left(PrintFailure());
    }
  }
}
