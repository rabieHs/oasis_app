import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oasis_app/core/consts.dart';
import 'package:oasis_app/views/sign_up.dart';

import '../services/auth.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  get fieldBackgroundColor => null;

  get formBackgroundColor => null;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Login",
          style: TextStyle(
            letterSpacing: 2.0,
            fontWeight: FontWeight.w800,
            fontSize: 26,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: fieldBackgroundColor,
                  labelText: "Email",
                )),
            const SizedBox(
              height: 25,
            ),
            TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: fieldBackgroundColor,
                  labelText: "Password",
                )),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () async {
                  final email = emailController.text;
                  final password = passwordController.text;
                  final result = await Authentication().login(email, password);

                  if (result == true) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("error"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Color.fromARGB(255, 33, 211, 235)),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
                text: TextSpan(
                    text: "You Don't have An Acccount? ",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUp())),
                    text: "SignUp",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 3, 56, 231)),
                  )
                ]))
          ]),
        ),
      ],
    ));
  }
}
