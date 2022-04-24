// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.name,
    required this.email,
    required this.online,
    required this.uid,
  });

  String name;
  String email;
  bool online;
  String uid;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        name: json["name"],
        email: json["email"],
        online: false,
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "online": online,
        "uid": uid,
      };
}
