import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proapi/screen/Firebse%20Property/forgetpassworScreen.dart';
import 'package:proapi/screen/Firebse%20Property/signUpScreen.dart';

class LogInWidgetScreen extends StatefulWidget {
  LogInWidgetScreen({Key? key}) : super(key: key);

  @override
  State<LogInWidgetScreen> createState() => _LogInWidgetScreenState();
}

class _LogInWidgetScreenState extends State<LogInWidgetScreen> {
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
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            textformFieldWidget(emailController, 'Email', 'Email'),
            textformFieldWidget(passwordController, 'Password', 'Password'),
            ElevatedButton(
              onPressed: () {
                signInFunc();
              },
              child: const Text('SignIn With Email and Password'),
            ),
            InkWell(
              onTap: (){
                 Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()));
             
              },
              child: const Text(
                'Forget Password',
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.underline),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'LogIn',
                children: [
                  WidgetSpan(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                      },
                      child: const Text(
                        'Sign Up ',
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

  Future signInFunc() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
