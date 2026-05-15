// lib/serices/user_service.dart

import 'dart:convert';
import 'package:biblioul/configs/generic_response.dart';
import 'package:flutter/services.dart';

import '../models/user.dart';

class UserService {
  Future<GenericResponse> login(User user) async {
    try {
      // leer el json como string
      String jsonString =
          await rootBundle.loadString('assets/jsons/users.json');
      // parsear el string a json
      final List<dynamic> jsonList = json.decode(jsonString);
      // instanciar objetos a partir de json
      final List<User> users =
          jsonList.map((json) => User.fromJson(json)).toList();

      // buscar el usario que coincide con el usuario del formulario
      for (User u in users) {
        if (user.username == u.username && user.password == u.password) {
          return GenericResponse(
              success: true, data: u, message: 'Login exitoso', error: null);
        }
      }
      // si sale del for, es que no encontró al usuario
      return GenericResponse(
          success: false,
          data: null,
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
