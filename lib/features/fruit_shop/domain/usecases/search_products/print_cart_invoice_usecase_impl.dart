import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../entities/cart_entity.dart';
import '../../services/print_cart_invoice_service.dart';
import 'print_cart_invoice_usecase.dart';

class PrintCartInvoiceUsecaseImpl implements PrintCartInvoiceUsecase {
  final PrintCartInvoiceService service;

  PrintCartInvoiceUsecaseImpl({required this.service});
  Future<Either<Failure, void>> call({required CartEntity cart}) async {
    return await this.service(cart: cart);
  }
}
