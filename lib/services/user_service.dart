import 'dart:convert';
import 'dart:io';

import 'package:mobile_dev_flutter/pages/util.dart';
import 'package:mobile_dev_flutter/services/session_service.dart';
import 'package:http/http.dart' as http;

class UserService{
  
  // final String _baseUrl = 'http://192.168.1.110:3030/users';
  final String _baseUrl = 'http://192.168.100.17:3030/users';

  final SessionService _session = SessionService();

  Future<List<dynamic>> getList() async{
    dynamic logged = await _session.getLoggedUser();

    if (logged == null){
      throw Exception('Sessão expirada');
    }

    String token = logged['token'];

    final Uri uri = Uri.parse(_baseUrl);

    final response = await http.get(
      uri,
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: appJson,
        HttpHeaders.authorizationHeader: "Bearer $token"
      }
    );

    if (response.statusCode == 200){
      return List.from(jsonDecode(response.body));
    }
    throw HttpException(response.body, uri: uri);
  }

  Future<String> createUser(String name, 
                            String username, 
                            String password) async {
    dynamic logged = await _session.getLoggedUser();

    if (logged == null) {
      throw Exception('Sessão expirada');
    }

    String token = logged['token'];

    final Uri uri = Uri.parse(_baseUrl);
    final response = await http.post(
      uri,
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: appJson,
        HttpHeaders.authorizationHeader: "Bearer $token"
      },
      body: jsonEncode(<String, String>{
          'name': name,
          'username': username,
          'password': password
        }
      )
    );

    if (response.statusCode == 201) {
      return('User created with success');
    } else {
      return('${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>>  getUserById(String userId) async {
    dynamic logged = await _session.getLoggedUser();

    if (logged == null) {
      throw Exception('Sessão expirada');
    }

    String token = logged['token'];

    final uri = Uri.parse('$_baseUrl/$userId');

    final response = await http.get(
      uri, 
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: appJson,
        HttpHeaders.authorizationHeader: "Bearer $token"
      }
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }
    throw HttpException(response.body, uri: uri);
  }

  Future<void> updateUser(String userId, Map<String, dynamic> user) async {
    try {
      dynamic logged = await _session.getLoggedUser();

      if (logged == null) {
        throw Exception('Sessão expirada');
      }

      final Uri uri = Uri.parse(_baseUrl);

      String token = logged['token'];

      final response = await http.put(
        uri,
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: appJson,
          HttpHeaders.authorizationHeader: "Bearer $token"
        },
        body: jsonEncode(user)
      );

      if (response.statusCode == 200) {
        print('Usuário atualizado com sucesso');
      } else {
        print('Erro ao atualizar usuário: ${response.statusCode}');
      }
    } catch (error) {
      print('Erro ao atualizar usuário: $error');
    }
  }


}