import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oasis_app/services/auth.dart';
import 'package:oasis_app/views/home.dart';
import 'package:oasis_app/views/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  get fieldBackgroundColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Register",
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
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: fieldBackgroundColor,
                  labelText: "Name",
                )),
            const SizedBox(
              height: 25,
            ),
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
            TextField(
                obscureText: true,
                controller: confirmController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: fieldBackgroundColor,
                  labelText: " Confirm Password",
                )),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () async {
                  final name = nameController.text;
                  final email = emailController.text;
                  final password = passwordController.text;
                  final confirmPassword = confirmController.text;

                  if (name.isEmpty ||
                      email.isEmpty ||
                      password.isEmpty ||
                      confirmPassword.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("field is empry"),
                      backgroundColor: Colors.orange,
                    ));
                  } else if (password != confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("please confirm your password"),
                      backgroundColor: Colors.orange,
                    ));
                  } else {
                    final result =
                        await Authentication().register(email, password, name);

                    if (result == true) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("error"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(color: Color.fromARGB(255, 33, 211, 235)),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
                text: TextSpan(
                    text: "Already have an account ? ",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login())),
                    text: "Login",
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
