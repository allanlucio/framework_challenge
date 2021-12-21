import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../core/extensions/double_extensions.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/entities/product_entity.dart';

class PDFGenerator {
  Future<void> generate() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageTheme: pw.PageTheme(margin: pw.EdgeInsets.zero),
        build: buildContent,
        footer: buildFooter,
        header: buildHeader,
      ),
    );

    Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
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

  pw.Widget buildFooter(context) {
    return pw.Container(
      color: PdfColors.grey200,
      height: 70,
      width: double.infinity,
      padding: pw.EdgeInsets.all(15),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        children: [
          pw.Text(
            "Total: ${1235.25.toBRLString()}",
            style: pw.TextStyle(
              fontSize: 25,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  List<pw.Widget> buildContent(context) {
    return [contentTable(context)];
  }

  pw.Widget contentTable(pw.Context context) {
    const headers = ["Nome", "Quantidade", "Valor unitário", "Total"];
    final cartItems = [
      CartItemEntity(
        ammount: 2,
        product: ProductEntity(
            description: "oi", imageUrl: "ola", name: "teste", price: 25),
      )
    ];
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
        data: cartItems.map((item) => itemToArray(item)).toList());
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
