// lib/serices/book_service.dart

import 'dart:convert';
import 'package:biblioul/configs/generic_response.dart';
import 'package:flutter/services.dart';

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
}
