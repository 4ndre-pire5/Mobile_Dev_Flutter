import 'package:mobile_dev_flutter/components/my_button.dart';
import 'package:mobile_dev_flutter/services/user_service.dart';
import 'package:flutter/material.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({super.key, required this.userId});

  final String userId;

  @override
  State<EditUserPage> createState() => _EditUserPage();
}

class _EditUserPage extends State<EditUserPage> {
  final _service = UserService();
  // final _serviceRoles = rolesService();
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  // List<String> selectedRoles = [];

  @override
  void initState() {
    super.initState();
    fetchUserById();
  }

  Future<void> fetchUserById() async {
    try {
      final Map<String, dynamic> userData =
          await _service.getUserById(widget.userId);

    if (userData.containsKey('password')) {
      password.text = userData['password'];
      print(password.text);
    } else {
      print("Não veio o password");
    }
    
      setState(() {
        name.text = userData['name'];
        username.text = userData['username'];
        password.text = userData['password'];
      });
    } catch (error) {
      print('Erro ao buscar usuário: $error');
    }
  }

  Future<void> save() async {
    try {
      if (name.text.isEmpty) {
        throw Exception('Nome é obrigatório');
      }

      if (username.text.isEmpty) {
        throw Exception('Login é obrigatório');
      } 

      if (password.text.isEmpty) {
        throw Exception('Senha é obrigatória');
      }
      
      final Map<String, dynamic> user = {
        'name': name.text,
        'username': username.text,
        'password': password.text
      };

      await _service.updateUser(widget.userId, user);
      print('Usuário atualizado');

      Navigator.pop(context);
    } catch (error) {
      print('Erro ao atualizar detalhes do usuário: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Usuário'),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Nome')
              ),
              TextField(
                controller: username,
                decoration: const InputDecoration(labelText: 'Login')
              ),
              TextField(
                controller: password,
                decoration: const InputDecoration(labelText: 'password'),
              ),
              MyButton(text: 'Atualizar', icon: Icons.save, press: save),
            ],
          ),
      )
    );
  }
}
