// lib/serices/book_service.dart

import 'dart:convert';
import 'package:biblioul/configs/constants.dart';
import 'package:biblioul/configs/generic_response.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class BookService {
  Future<GenericResponse<List<Book>>> fetchAll() async {
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
      return GenericResponse<List<Book>>(
        success: true,
        data: books,
        message: 'Lista local de libros',
        error: null,
      );
    } catch (e, stackTrace) {
      return GenericResponse<List<Book>>(
        success: false,
        data: null,
        message: 'No se pudo cargar la lista local de libros',
        error: stackTrace.toString(),
      );
    }
  }

  Future<GenericResponse<List<Book>>> fetchAllV2() async {
    try {
      final url = Uri.parse('${Constants.baseUrl}/apis/v2/books');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body) as Map<String, dynamic>;

        return GenericResponse<List<Book>>.fromJson(
          jsonResponse,
          fromJsonT: (data) => (data as List<dynamic>)
              .map((book) => Book.fromJson(book as Map<String, dynamic>))
              .toList(),
        );
      }

      return GenericResponse<List<Book>>(
        success: false,
        message: 'El backend respondió ${response.statusCode}',
        error: response.body,
      );
    } catch (e) {
      return GenericResponse<List<Book>>(
        success: false,
        message: 'No se pudo consultar el backend',
        error: e.toString(),
      );
    }
  }

  Future<GenericResponse<List<Book>>> searchByGenresIds(
    List<int> genresIds,
  ) async {
    try {
      final remoteResponse = await fetchAllV2();
      List<Book>? books = remoteResponse.data;

      if (books == null) {
        final localResponse = await fetchAll();
        books = localResponse.data;
      }

      final List<Book> filteredBooks = (books ?? []).where((book) {
        return book.genres.any(
          (genre) => genresIds.contains(genre.id),
        );
      }).toList();

      return GenericResponse<List<Book>>(
        success: true,
        data: filteredBooks,
        message: 'Libros filtrados por género',
        error: null,
      );
    } catch (e, stackTrace) {
      return GenericResponse<List<Book>>(
        success: false,
        data: null,
        message: 'No se pudieron filtrar los libros',
        error: stackTrace.toString(),
      );
    }
  }
}
