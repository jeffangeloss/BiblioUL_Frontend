// lib/serices/book_service.dart

import 'dart:convert';
import 'package:biblioul/configs/constants.dart';
import 'package:biblioul/configs/generic_response.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class BookService {
  Future<GenericResponse> fetchAll() async {
    try {
      // leer el json como string
      String jsonString =
          await rootBundle.loadString('assets/jsons/books.json');
      // parsear el string a json
      final List<dynamic> jsonList = json.decode(jsonString);
      // instanciar objetos a partir de json
      final List<Book> books =
          jsonList.map((json) => Book.fromJson(json)).toList();

      // si sale del for, es que no encontró al usuario
      return GenericResponse(
          success: false,
          data: books,
          message: 'Usuario y/o contraseña no válidos',
          error: null);
    } catch (e, stackTrace) {
      print('Error: $e'); // 'Error ' + e;
      print('Stack Trace: $stackTrace');
      return GenericResponse(
          success: false,
          data: null,
          message: 'Ocurrió un error no esperado en el login',
          error: stackTrace.toString());
    }
  }

  Future<GenericResponse> searchByGenresIds(List<int> genresIds) async {
    try {
      // llamar al servidor
      final String baseURL =  Constants.baseUrl;
      final url = Uri.parse(baseURL + 'apis/v1/books');

      final response = await http.get(url, headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
      });

      // leer el json como string
      String jsonString =
          await rootBundle.loadString('assets/jsons/books.json');
      // parsear el string a json
      final List<dynamic> jsonList = json.decode(jsonString);
      // instanciar objetos a partir de json
      final List<Book> books =
          jsonList.map((json) => Book.fromJson(json)).toList();

      final List<Book> filteredBooks = books.where((book) {
        return book.genres.any(
          (genre) => genresIds.contains(genre.id),
        );
      }).toList();

      // si sale del for, es que no encontró al usuario
      return GenericResponse(
          success: false,
          data: filteredBooks,
          message: 'Usuario y/o contraseña no válidos',
          error: null);
    } catch (e, stackTrace) {
      print('Error: $e'); // 'Error ' + e;
      print('Stack Trace: $stackTrace');
      return GenericResponse(
          success: false,
          data: null,
          message: 'Ocurrió un error no esperado en el login',
          error: stackTrace.toString());
    }
  }
}
