import 'dart:convert';

import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/users.dart';
import 'package:chat_app/models/users_response.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:http/http.dart' as http;

class UsersService {
  Future<List<Usuario>> getUsers() async {
    try {
      String? userToken = await AuthService.getToken();

      final resp = await http.get(Uri.parse('${Environment.apiUrl}/users'),
          headers: {'x-token': userToken.toString()});
      final usersResponse = UsersResponse.fromJson(jsonDecode(resp.body));

      return usersResponse.users;
    } catch (error) {
      print('getUsersError $error');
      return [];
    }
  }
}
