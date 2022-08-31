import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ransel_app/pages/forgot_password_page.dart';
import 'package:ransel_app/pages/main_page.dart';
import 'package:ransel_app/pages/register_page.dart';
import 'package:ransel_app/pages/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool is_visible = true;
  final _key = GlobalKey<FormState>();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
          child: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Container(
                  height: 212,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/hero.png"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const Text(
                  "Login Mitra LEU",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                  controller: noHpController,
                  validator: (e) {
                    if (e!.contains("62")) {
                      return "Masukkan dengan format 08xxxxx";
                    } else if (!e.contains("08")) {
                      return "Masukkan dengan format 08xxxxx";
                    } else if (e.isEmpty) {
                      return "Tolong masukkan nomor handphone";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    label: const Text("No Handphone"),
                    suffixIcon: const Icon(Icons.phone_android),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFE0E0E0),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusColor: primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                TextFormField(
                  controller: passController,
                  obscureText: is_visible,
                  initialValue: null,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Masukkan Password anda";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFE0E0E0),
                        width: 2,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          is_visible = !is_visible;
                        });
                      },
                      icon: Icon(
                        is_visible ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    focusColor: primaryColor,
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 24.0,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate() &&
                            noHpController.text.isNotEmpty &&
                            passController.text.isNotEmpty) {
                          log("Login...");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainPage()));
                        } else {
                          log("Email atau password salah");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                      ),
                      child: const Text("Login")),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage()),
                    );
                  },
                  child: const Text(
                    "Lupa password ?",
                    style: TextStyle(fontSize: 12, color: primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Belum Punya Akun ?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      child: const Text(
                        " Registrasi Akun",
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
