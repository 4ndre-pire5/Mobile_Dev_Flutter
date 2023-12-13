import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobile_dev_flutter/pages/util.dart';
import 'package:mobile_dev_flutter/services/session_service.dart';

class AuthService{

  final String _baseUrl = 'http://192.168.100.17:3030/auth/login';

  final SessionService _session = SessionService();

  Future<dynamic> login(String username, String password) async {

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: appJson
      },
      body: jsonEncode(
        <String, String>{'username': username, 'password': password}
      )
    );

    if (response.statusCode == 201){
      dynamic user = jsonDecode(response.body);
      await _session.setLoggedUser(user);
      return user;
    }

    return null;

  }
  
}