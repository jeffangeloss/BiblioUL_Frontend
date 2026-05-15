// lib/pages/sign_in/sign_in_page.dart
import 'dart:html';

import 'package:biblioul/components/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  SignInController control = Get.put(SignInController());

  SignInPage({super.key});

  Widget _form(BuildContext context, ColorScheme colors) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.background, // El color va aquí dentro
        border: Border.all(
          width: 1,
          color: Colors.grey, // Color del borde
        ),
      ),
      child: Column(
        children: [
          Text('INGRESA ESTA INFORMACIÓN'),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: control.username,
            decoration: InputDecoration(
              hintText: 'Usuario',
              prefixIcon: Icon(Icons.person),
              border: UnderlineInputBorder(),
            ),
          ),
          TextField(
            controller: control.password,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              prefixIcon: Icon(Icons.lock),
              border: UnderlineInputBorder(),
            ),
          ),
          Obx(() => Column(
                children: [
                  SizedBox(height: control.message.value == '' ? 0 : 10),
                  Text(
                    control.message.value,
                    style: TextStyle(color: control.messageColor.value),
                  ),
                  SizedBox(height: control.message.value == '' ? 0 : 10),
                ],
              )),
          /*Text(
              'Usuario y contreseña no valido'
              style: TextStyle(color: Colors.red),
            ),*/

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                print('hola en la vista');
                control.login();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.secondary,
                foregroundColor: colors.surface,
                padding: EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Text(
                'INICIAR SESIÓN',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('No tienes una cuenta?'),
              SizedBox(
                width: 4,
              ),
              InkWell(
                onTap: () {
                  control.goToSignUp(context);
                },
                child: Text(
                  'Creala aquí',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _recoverPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Olvidaste tu contraseña?'),
        SizedBox(
          width: 4,
        ),
        InkWell(
          onTap: () {
            control.goToRecoverPassword(context);
          },
          child: Text(
            'Recuperala aquí',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget _background(BuildContext context, ColorScheme colors) {
    return Column(
      children: [
        // 30% superior
        Expanded(
          flex: 5, // 30%
          child: Container(
            width: double.infinity,
            color: colors.tertiaryContainer, // puedes cambiar color
          ),
        ),

        // 70% inferior
        Expanded(
          flex: 5, // 70%
          child: Container(
            width: double.infinity,
            color: colors.surfaceContainerHighest, // otro color
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return SafeArea(
        child: Stack(children: [
      _background(context, colors),
      Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // centra horizontalmente
            children: [LoginHeader()],
          ),
          _form(context, colors),
          Spacer(),
          _recoverPassword(context),
          SizedBox(
            height: 15,
          )
        ],
      ),
    ]));
  }

  /*
  Column(
    children:[
      SafeArea...
    ]
  )

   */

  @override
  Widget build(BuildContext context) {
    control.context = context;

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: _buildBody(context),
      ),
    );
  }
}
