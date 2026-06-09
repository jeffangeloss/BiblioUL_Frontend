// lib/serices/book_service.dart

import 'dart:convert';
import 'package:biblioul/configs/generic_response.dart';
import 'package:flutter/services.dart';

import '../models/genre.dart';

class GenreService {
  Future<GenericResponse> fetchAll() async {
    try {
      // leer el json como string
      String jsonString =
          await rootBundle.loadString('assets/jsons/genres.json');
      // parsear el string a json
      final List<dynamic> jsonList = json.decode(jsonString);
      // instanciar objetos a partir de json
      final List<Genre> genres =
          jsonList.map((json) => Genre.fromJson(json)).toList();

      // si sale del for, es que no encontró al usuario
      return GenericResponse(
          success: false,
          data: genres,
          message: 'Lista de géneros',
          error: null);
    } catch (e, stackTrace) {
      print('Error: $e'); // 'Error ' + e;
      print('Stack Trace: $stackTrace');
      return GenericResponse(
          success: false,
          data: null,
          message: 'Ocurrió un error no esperado listar los géneros',
          error: stackTrace.toString());
    }
  }
}
