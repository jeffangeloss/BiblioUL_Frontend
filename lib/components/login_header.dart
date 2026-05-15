// lib/compnents/login_hader.dart
//
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  LoginHeader();

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Image.asset(
          'assets/images/ulises.png',
          width: 140,
          height: 140,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'BiblioApp ULima',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
