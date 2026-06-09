import 'package:biblioul/models/book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'read_book_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadBookPage extends StatelessWidget {
  final ReadBookController control = Get.put(ReadBookController());

  ReadBookPage({super.key});

  Widget _buildBody(BuildContext context) {
    if (control.book.pdfUrl == null || control.book.pdfUrl!.isEmpty) {
      return const Center(
        child: Text('Este libro no tiene un PDF disponible.'),
      );
    }

    return SfPdfViewer.network(
      control.book.pdfUrl!,
    );
  }

  @override
  Widget build(BuildContext context) {
    control.book = ModalRoute.of(context)!.settings.arguments as Book;
    // recives parámetro por parámetro
    //final String pdfUrl = args['pdf_url'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: _buildBody(context),
    );
  }
}
