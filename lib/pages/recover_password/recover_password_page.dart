// lib/pages/recover_password/recover_password_page.dart
import 'dart:html';

import 'package:biblioul/components/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'recover_password_controller.dart';

class RecoverPasswordPage extends StatelessWidget {
  RecoverPasswordController control = Get.put(RecoverPasswordController());

  RecoverPasswordPage({super.key});

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
          Text('SOLICITE CAMBIO DE CONTRASEÑA'),
          SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Correo',
              prefixIcon: Icon(Icons.email),
              border: UnderlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Usuario y contraseña no válidos',
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.secondary,
                foregroundColor: colors.surface,
                padding: EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Text(
                'ENVIAR CORREO',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
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
      child: Stack(
        children: [
          _background(context, colors),
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [LoginHeader()],
                  ),
                  _form(context, colors),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          _backButton(context),
        ],
      ),
    );
  }

  /*
  Column(
    children:[
      SafeArea...
    ]
  )

   */

  Widget _backButton(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      child: SafeArea(
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: _buildBody(context),
      ),
    );
  }
}
