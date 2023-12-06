import 'package:flutter/material.dart';
import 'package:mobile_dev_flutter/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _username = '';
  var _password = '';

  signIn() {
    if (_username == 'uedsonreis' && _password == '123456') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    } else {
      alert(context, 'Usuário/senha inválido(a)!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acesso')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            autocorrect: false,
            enableSuggestions: false,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
              border: UnderlineInputBorder(),
              labelText: 'Login',
            ),
            onChanged: (value) => setState(() => _username = value),
          ),
          TextFormField(
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
              border: UnderlineInputBorder(),
              labelText: 'Senha',
            ),
            onChanged: (value) => setState(() => _password = value),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.login),
                onPressed: () => signIn(),
                label: Text('Entrar'),
              ),
            ),
          )
        ],
      )),
    );
  }
}
