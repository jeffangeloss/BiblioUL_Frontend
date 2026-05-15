// main.dart

import 'package:biblioul/pages/home/home_page.dart';
import 'package:biblioul/pages/recover_password/recover_password_page.dart';
import 'package:biblioul/pages/sign_up/sign_up_page.dart';
import 'package:biblioul/pages/template/template_page.dart';
import 'package:flutter/material.dart';
import 'pages/sign_in/sign_in_page.dart';
import './configs/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // tema
    //
    final TextTheme baseTextTheme = Typography.material2021().englishLike;
    final MaterialTheme materialTheme = MaterialTheme(baseTextTheme);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: materialTheme.light(),
        darkTheme: materialTheme.dark(),
        themeMode: ThemeMode.system,
        initialRoute: '/home',
        routes: {
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/recover-password': (context) => RecoverPasswordPage(),
          '/home': (context) => HomePage(),
        },
        home: SignInPage());
  }
}
