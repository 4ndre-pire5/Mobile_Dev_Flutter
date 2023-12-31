import 'package:flutter/material.dart';
import 'package:mobile_dev_flutter/components/my_button.dart';
import 'package:mobile_dev_flutter/components/my_input.dart';
import 'package:mobile_dev_flutter/pages/home.dart';
import 'package:mobile_dev_flutter/pages/util.dart';
import 'package:mobile_dev_flutter/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthService authService = AuthService();

  var _username = '';
  var _password = '';

  signIn() {
    authService.login(_username, _password).then((value) {
      if (value != null && value['token'] != null){
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => const MyHomePage())
        );
      }
      else {
        alert(context, 'Usuário/Senha inválido(a)!');  
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acesso')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyInput(
              text: 'Login',
              change: (value) => setState(() => _username = value)
            ),
            MyInput(
              text: 'Senha',
              change: (value) => setState(() => _password = value),
              isObscure: true,
            ),
            MyButton(text: 'Entrar', icon: Icons.login, press: signIn)
          ],
        )
      ),
    );
  }
}
