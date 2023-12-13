import 'dart:convert';
import 'dart:io';

import 'package:mobile_dev_flutter/pages/util.dart';
import 'package:mobile_dev_flutter/services/session_service.dart';
import 'package:http/http.dart' as http;

class UserService{
  
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
}