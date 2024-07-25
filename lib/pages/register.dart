import 'package:app_troco/components/my_button.dart';
import 'package:app_troco/components/my_textfield.dart';
import 'package:app_troco/components/my_textrow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // methods
  void registerUserIn() async {
    // loading screen
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    // try creating user
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        showErrorMessage('As senhas não são iguais.');
      }
      // Pop loading Screen
    } on FirebaseAuthException catch (e) {
      // Pop loading Screen
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }

  // Wrong error message
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                // Logo da Aplicação
                const Icon(Icons.restaurant_rounded, size: 75),

                const SizedBox(height: 50),
                // Bem vindo de volta
                Text(
                  "Vamos criar uma conta para você!",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),
                // useremail textfield
                MyTextField(
                  controller: emailController,
                  hintText: "E-mail",
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: "Senha",
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirmar Senha",
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                // Conexão local
                const MyTextRow(
                  helpText: 'Deseja usar localmente?',
                  coloredText: 'Clique aqui',
                ),

                const SizedBox(height: 10),

                // Entrar no sistema
                MyButton(
                  text: "Criar sua conta!",
                  onTap: registerUserIn,
                ),

                const SizedBox(height: 10),
                // Não tem uma conta? faça uma agora
                MyTextRow(
                  onTap: widget.onTap,
                  helpText: 'Já possui uma conta?',
                  coloredText: 'Entre agora!',
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
