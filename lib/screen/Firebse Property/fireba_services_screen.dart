import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proapi/screen/Firebse%20Property/logInWidgetScreen.dart';

class FirebaseServicesScreen extends StatefulWidget {
  const FirebaseServicesScreen({Key? key}) : super(key: key);

  @override
  State<FirebaseServicesScreen> createState() => _FirebaseServicesScreenState();
}

class _FirebaseServicesScreenState extends State<FirebaseServicesScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Home Page '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              user!.emailVerified.toString(),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            user!.emailVerified
                ? InkWell(
                    onTap: () {
                      user!.sendEmailVerification().then((value) {
                        log('Done');
                      });
                    },
                    child: const Text('Email is Verified '))
                : InkWell(
                    onTap: () {
                      user!.sendEmailVerification();
                    },
                    child: const Text('Email not Verify')),
            const Text('LogIn As '),
            Text(user!.email.toString()),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: const Text('LogOut')),
          ],
        ),
      ),
    );
  }

  logoutFunction() {}
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const FirebaseServicesScreen();
          } else {
            return LogInWidgetScreen();
          }
        },
      ));
}
