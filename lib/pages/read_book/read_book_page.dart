import 'package:biblioul/models/book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'read_book_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadBookPage extends StatelessWidget {
  ReadBookController control = Get.put(ReadBookController());

  ReadBookPage({super.key});

  Widget _buildBody(BuildContext context) {
    return SfPdfViewer.network(
      control.book.pdfUrl!,
    );
  }

  @override
  Widget build(BuildContext context) {
    control.book = ModalRoute.of(context)!.settings.arguments as Book;
    // recives parámetro por parámetro
    //final String pdfUrl = args['pdf_url'];

    print('1x ++++++++++++++++++++++++++++++++++');
    print(control.book.pdfUrl);
    print('2x ++++++++++++++++++++++++++++++++++');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: _buildBody(context),
    );
  }
}
