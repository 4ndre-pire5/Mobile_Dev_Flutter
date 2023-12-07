import 'package:flutter/material.dart';
import 'package:mobile_dev_flutter/components/my_button.dart';
import 'package:mobile_dev_flutter/components/my_input.dart';
import 'package:mobile_dev_flutter/pages/util.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var _name = '';
  var _username = '';
  var _password = '';
  var _confirmPassword = '';

  void save() {
    if (_name.trim().isEmpty) {
      alert(context, 'Nome é obrigatório');
      return;
    }
    if (_username.trim().isEmpty) {
      alert(context, 'Login é obrigatório');
      return;
    }
    if (_password.trim().isEmpty) {
      alert(context, 'Senha é obrigatória');
      return;
    }
    if (_confirmPassword != _password) {
      alert(context, 'Senha não confere');
      return;
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Novo Usuário'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyInput(
                  text: 'Nome',
                  change: (value) => setState(() => _name = value)),
              MyInput(
                  text: 'Login',
                  change: (value) => setState(() => _username = value)),
              MyInput(
                  text: 'Senha',
                  change: (value) => setState(() => _password = value),
                  isObscure: true),
              MyInput(
                  text: 'Confirmar Senha',
                  change: (value) => setState(() => _confirmPassword = value),
                  isObscure: true),
              MyButton(text: 'Salvar', icon: Icons.save, press: save)
            ],
          ),
        ));
  }
}
