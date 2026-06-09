import 'package:biblioul/models/genre.dart';
import 'package:biblioul/services/book_service.dart';
import 'package:biblioul/services/genre_services.dart';
import 'package:get/get.dart';

import '../../configs/generic_response.dart';
import '../../models/book.dart';

class Search2Controller extends GetxController {
  BookService bookService = BookService();

  GenreService genreService = GenreService();

  RxList<Book> books = <Book>[].obs;
  RxList<Genre> genres = <Genre>[].obs;

  RxList<int> genresIdsSelected = <int>[].obs;

  void fetchAll() async {
    GenericResponse<List<Book>> response = await bookService.fetchAll();
    GenericResponse<List<Book>> responseV2 = await bookService.fetchAllV2();

    books.assignAll(responseV2.data ?? response.data ?? <Book>[]);
  }

  void fetchAllGenres() async {
    GenericResponse response = await genreService.fetchAll();
    genres.value = response.data;
  }

  void searchByGenresIds() async {
    final genresIds = List<int>.from(genresIdsSelected);
    if (genresIds.isNotEmpty) {
      final response = await bookService.searchByGenresIds(genresIds);
      books.assignAll(response.data ?? <Book>[]);
    } else {}
  }
}
