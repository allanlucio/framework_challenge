import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/extensions/double_extensions.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../infra/datasources/print_cart_invoice_data_source.dart';
import '../../infra/models/cart_model.dart';

class CartInvoiceDataSourceImpl implements CartInvoiceDataSource {
  @override
  Future<void> call({required CartModel cart}) async {
    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.MultiPage(
          pageTheme: pw.PageTheme(margin: pw.EdgeInsets.zero),
          build: (context) => buildContent(context, cart.items.toList()),
          footer: (context) => buildFooter(context, cart),
          header: buildHeader,
        ),
      );

      await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdf.save());
    } on Exception {
      throw PrintException();
    }
  }

  pw.Widget buildHeader(context) {
    return pw.Container(
      color: PdfColors.grey200,
      height: 70,
      width: double.infinity,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Text(
            "Fatura",
            style: pw.TextStyle(
              fontSize: 25,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Row(children: [
            pw.Text(
              "Local: Shop Fruit",
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 21,
              ),
            )
          ])
        ],
      ),
    );
  }

  pw.Widget buildFooter(context, CartModel cart) {
    return pw.Container(
      color: PdfColors.grey200,
      height: 70,
      width: double.infinity,
      padding: pw.EdgeInsets.all(15),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        children: [
          pw.Text(
            "Total: ${cart.total.toBRLString()}",
            style: pw.TextStyle(
              fontSize: 25,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  List<pw.Widget> buildContent(pw.Context context, List<CartItemEntity> items) {
    return [contentTable(context, items)];
  }

  pw.Widget contentTable(pw.Context context, List<CartItemEntity> items) {
    const headers = ["Nome", "Quantidade", "Valor unitário", "Total"];

    return pw.Table.fromTextArray(
        cellAlignment: pw.Alignment.centerLeft,
        headerHeight: 25,
        cellHeight: 35,
        cellAlignments: {
          0: pw.Alignment.centerLeft,
          1: pw.Alignment.centerLeft,
          2: pw.Alignment.centerRight,
          3: pw.Alignment.centerRight
        },
        cellStyle: pw.TextStyle(fontSize: 10),
        headerStyle: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
        headers: headers,
        data: items.map((item) => itemToArray(item)).toList());
  }

  List<String> itemToArray(CartItemEntity item) {
    return [
      item.product.name,
      item.ammount.toString(),
      item.product.price.toBRLString(),
      item.total.toBRLString(),
    ];
  }
}
