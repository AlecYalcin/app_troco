import "package:app_troco/pages/app.dart";
import "package:app_troco/pages/login.dart";
import "package:app_troco/pages/register.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

// Auth
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
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}

// Login or Register
class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // login pagin
  bool showLoginPage = true;

  // methods
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
