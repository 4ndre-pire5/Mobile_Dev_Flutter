import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _title = 'Listagem de Usuários';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Usuário 1'),
            Text('Usuário 2'),
            Text('Usuário 3'),
            Text('Usuário 4'),
            Text('Usuário 5'),
          ],
        ),
      ),
    );
  }
}
