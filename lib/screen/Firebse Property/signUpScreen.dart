import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proapi/screen/Firebse%20Property/fireba_services_screen.dart';
import 'package:proapi/screen/Firebse%20Property/logInWidgetScreen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
            const Icon(
              Icons.flutter_dash,
              size: 45,
            ),
            const Text('Well Come to the SignUp Page '),
            textformFieldWidget(emailController, 'Email', 'Email'),
            textformFieldWidget(passwordController, 'Password', 'Password'),
            ElevatedButton(
              onPressed: () {
                createAccountFun();
              },
              child: const Text('SignUp With Email and Password'),
            ),
            RichText(
              text: TextSpan(
                text: 'Already have Acount    ',
                style: const TextStyle(color: Colors.black),
                children: [
                  WidgetSpan(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LogInWidgetScreen()));
                      },
                      child: const Text(
                        'LogIn ',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
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

  Future createAccountFun() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const MainPage()));
      });
    } catch (e) {
      print(e);
    }
  }
}
