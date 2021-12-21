import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';

import '../../../../design_system/widgets/scaffold/fruit_shop_scaffold.dart';

class PDFViewerPage extends StatefulWidget {
  const PDFViewerPage({Key? key, required this.pdf}) : super(key: key);
  final File pdf;

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  PDFDocument? _document;

  @override
  void initState() {
    super.initState();
    readDocument();
  }

  readDocument() async {
    _document = await PDFDocument.fromFile(widget.pdf);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FruitShopScaffold(
        title: Text("Documento"),
        body: _document != null
            ? PDFViewer(
                document: _document!,
              )
            : Text("Não foi possível carregar o PDF"));
  }
}
