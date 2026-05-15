// lib/pages/sign_up/sign_up_page.dart

import 'package:biblioul/components/login_header.dart';
// lib/pages/sign_up/sign_up_page.dart

import 'package:biblioul/components/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_up_controller.dart';

class SignUpPage extends StatelessWidget {
  SignUpController control = Get.put(SignUpController());

  SignUpPage({super.key});

  Widget _form(BuildContext context, ColorScheme colors) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.background,
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Column(
        children: [
          const Text('CREAR CUENTA'),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Usuario',
              prefixIcon: Icon(Icons.person),
              border: UnderlineInputBorder(),
            ),
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              prefixIcon: Icon(Icons.lock),
              border: UnderlineInputBorder(),
            ),
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Repetir Contraseña',
              prefixIcon: Icon(Icons.lock),
              border: UnderlineInputBorder(),
            ),
          ),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Correo',
              prefixIcon: Icon(Icons.email),
              border: UnderlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Usuario y contraseña no válidos',
            style: TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.secondary,
                foregroundColor: colors.surface,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text(
                'CREAR CUENTA',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _background(BuildContext context, ColorScheme colors) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            color: colors.tertiaryContainer,
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            color: colors.surfaceContainerHighest,
          ),
        ),
      ],
    );
  }

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

  Widget _buildBody(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          _backButton(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
    );
  }
}
