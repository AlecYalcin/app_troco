import "package:app_troco/pages/app.dart";
import "package:app_troco/pages/login.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged
          if (snapshot.hasData) {
            return const MyHomePage(title: 'App do Troco!');
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
