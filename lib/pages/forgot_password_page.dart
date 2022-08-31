import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot passwrod page"),
      ),
      body: const Center(
        child: Text(
          "Forgot password page",
          style: TextStyle(),
        ),
      ),
    );
  }
}
