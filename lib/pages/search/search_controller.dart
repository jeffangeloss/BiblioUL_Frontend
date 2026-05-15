import 'package:biblioul/services/book_service.dart';
import 'package:get/get.dart';

import '../../configs/generic_response.dart';
import '../../models/book.dart';

class Search2Controller extends GetxController {
  BookService bookService = BookService();
  RxList<Book> books = <Book>[].obs;

  void fetchAll() async {
    GenericResponse response = await bookService.fetchAll();
    books.value = response.data;
    print(response.data);
  }
}
