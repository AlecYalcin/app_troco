import 'package:app_troco/components/my_button.dart';
import 'package:app_troco/components/my_textfield.dart';
import 'package:app_troco/components/my_textrow.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // methods
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              // Logo da Aplicação
              const Icon(Icons.restaurant_rounded, size: 75),

              const SizedBox(height: 50),
              // Bem vindo de volta
              Text(
                "Bem vindo, sentimos sua falta!",
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
              // esqueceu a senha?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
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
                onTap: signUserIn,
              ),

              const SizedBox(height: 10),
              // Não tem uma conta? faça uma agora
              const MyTextRow(
                helpText: 'Não possui uma conta?',
                coloredText: 'Crie uma agora!',
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
