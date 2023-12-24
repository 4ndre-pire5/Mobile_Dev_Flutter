import 'package:flutter/material.dart';
import 'package:mobile_dev_flutter/pages/login.dart';
import 'package:mobile_dev_flutter/pages/user.dart';
import 'package:mobile_dev_flutter/pages/edituser.dart';
import 'package:mobile_dev_flutter/services/user_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _HomePageState();

}

class _HomePageState extends State<MyHomePage>{
  final _title = 'Listagem de Usuários';
  final _service = UserService();

  Future<List<dynamic>> fetchUsers() async {
    try {
      // return await _service.getList();
      List<dynamic> list = await _service.getList();
      return list;
    } 
    catch (e){
      return [];
    }
  }

  void goToCreateUser(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const UserPage()));
  }

  void logOut(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () => goToCreateUser(context),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logOut(context),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return FutureBuilder(
      future: fetchUsers(),
      builder: (context, snapshot) {
        List<dynamic> users = snapshot.data ?? [];

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(users[index]['name']),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(users[index]['username']),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditUserPage(
                            userId: (users[index]['id']).toString()
                          ),
                        )
                      );
                    },
                    child: const Text('Editar'),
                  ),
                )
              ],
            );
          }
        );
      },
    );
  }
}
