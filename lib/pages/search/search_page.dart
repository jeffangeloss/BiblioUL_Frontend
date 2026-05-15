// lib/pages/search/search_page.dart
import 'package:biblioul/components/book_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './search_controller.dart';

class SearchPage extends StatelessWidget {
  Search2Controller control = Get.put(Search2Controller());

  SearchPage({super.key});

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        if (control.books.isEmpty) {
          return const Center(
            child: Text("No hay libros"),
          );
        }

        return ListView.builder(
          itemCount: control.books.length,
          itemBuilder: (context, index) {
            final book = control.books[index];

            return BookInfo(
              book: book,
            );
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    control.fetchAll();
    return _buildBody(context);
  }
}
