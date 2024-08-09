import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class UserDTO with ChangeNotifier{
  final int? userId;
  final String? username;
  final String? password;
  String? nickname;
  final List<String>? authorities;

  UserDTO({
    this.userId,
    this.username,
    this.password,
    this.nickname,
    this.authorities,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      userId: json['userId'],
      username: json['username'],
      nickname: json['nickname'],
      authorities: (json['authorities'] as List).cast(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'password': password,
      'nickname': nickname,
      'authorities': authorities,
    };
  }
}

// Future<void> sendUser(UserDTO user) async {
//   final url = Uri.parse(''); //API URL로 변경
//   final response = await http.post(
//     url,
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode(user.toJson()),
//   );
//
//   if (response.statusCode == 200) {
//     print('successful');
//   } else {
//     print('failed: ${response.statusCode}');
//   }
// }


class NickNameResponseDTO with ChangeNotifier{
  final String? nickname;

  NickNameResponseDTO({
    this.nickname,
  });

  factory NickNameResponseDTO.fromJson(Map<String, dynamic> json) {
    return NickNameResponseDTO(
      nickname: json['nickname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
    };
  }
}
