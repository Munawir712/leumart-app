import 'package:flutter/material.dart';
import 'package:leumart_app/pages/login_page.dart';
import 'package:leumart_app/pages/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Leu Mart",
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: primaryColor,
            ),
      ),
    );
  }
}
