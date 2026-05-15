// lib/pages/sign_in/sign_in_controller.dart
import 'package:biblioul/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/generic_response.dart';
import '../../models/user.dart';

class SignInController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxString message = ''.obs;
  RxBool success = false.obs;

  BuildContext? context;

  Rx<Color> messageColor = Colors.red.obs;

  UserService userService = UserService();

  void _cleanMessage() {
    Future.delayed(Duration(seconds: 5), () {
      message.value = '';
    });
  }

  void login() async {
    print('hola estoy en login');

    print(username.text);
    print(password.text);
    if (username.text != '' && password.text != '') {
      User user = User.login(username: username.text, password: password.text);
      GenericResponse response = await userService.login(user);
      print('Usuerio logueado:');
      print(response.data);

      if (response.success) {
        messageColor.value = Colors.green;
      } else {
        messageColor.value = Colors.red;
      }

      message.value = response.message;
    } else {
      messageColor.value = Colors.orange;
      message.value = 'Debe ingresar usuario y contraseña';
    }

    _cleanMessage();
  }

  void goToSignUp(BuildContext context) {
    Navigator.pushNamed(context, '/sign-up');
  }

  void goToRecoverPassword(BuildContext context) {
    Navigator.pushNamed(context, '/recover-password');
  }
}
