import 'package:chat_app/global/environment.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/messages_response.dart';
import '../models/users.dart';

class ChatService with ChangeNotifier {
  late Usuario userChat;
  Future<List<Message>?> getChat(String userId) async {
    try {
      String? userToken = await AuthService.getToken();
      final resp = await http.get(
          Uri.parse('${Environment.apiUrl}/messages/$userId'),
          headers: {'x-token': userToken.toString()});

      final messagesResp = messagesResponseFromJson(resp.body);

      return messagesResp.messages;
    } catch (error) {
      print('ChatService $error');
    }
  }
}
