import 'package:chat_app/global/environment.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  ServerStatus get serverStatus => _serverStatus;
  late IO.Socket _socket;
  IO.Socket get socket => _socket;

  Function get emit => _socket.emit;

  void connect() async {
    final token = await AuthService.getToken();

    _socket = IO.io(
        Environment.socketUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            //.enableForceNew()
            .disableAutoConnect()
            .setExtraHeaders({
              "x-token": token,
            })
            .build());
    _socket.connect();

    _socket.onConnect(
      (_) {
        _serverStatus = ServerStatus.Online;
        print('onConnect');
        print("$_serverStatus");
        notifyListeners();
      },
    );

    _socket.onDisconnect(
      (_) {
        _serverStatus = ServerStatus.Offline;
        print('onDisconnect');
        print("$_serverStatus");
        notifyListeners();
      },
    );
    print("$_serverStatus");
  }

  void disconnect() {
    socket.disconnect();
  }
}
