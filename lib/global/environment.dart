// Esta clase va contener solo metodos estaticos

import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid
      ? 'http://192.168.100.23:3000/api'
      : 'localhost:3000/api';
  static String socketUrl =
      Platform.isAndroid ? 'http://192.168.100.23:3000' : 'localhost:3000';
}
