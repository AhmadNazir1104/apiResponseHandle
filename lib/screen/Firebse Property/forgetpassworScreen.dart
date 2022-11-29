import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textformFieldWidget(emailController, 'Email', 'Email'),
          // ignore: prefer_const_constructors
          ElevatedButton.icon(
              onPressed: () {
                resetPasswordFunc();
              },
              icon: const Icon(
                Icons.message,
                color: Colors.black,
              ),
              label: const Text('Reset Password'))
        ],
      ),
    ));
  }

  Widget textformFieldWidget(
    TextEditingController controll,
    String hintText,
    String labelText,
  ) {
    return TextFormField(
      controller: controll,
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        icon: const Icon(Icons.person),
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }

  Future resetPasswordFunc() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());
  }
}
