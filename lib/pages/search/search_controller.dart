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
    GenericResponse response = await bookService.fetchAll();
    books.value = response.data;
    print(response.data);
  }

  void fetchAllGenres() async {
    GenericResponse response = await genreService.fetchAll();
    genres.value = response.data;

    print(response.data);
  }

  void searchByGenresIds() async {
    print('Tópicos seleccionados: ${genresIdsSelected}');
    List<int> genresIds = genresIdsSelected.value;
    if (!genresIds.isEmpty) {
      GenericResponse response = await bookService.searchByGenresIds(genresIds);
      books.value = response.data;
    } else {}
  }
}
