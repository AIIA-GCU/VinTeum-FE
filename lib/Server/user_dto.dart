import 'dart:convert';
import 'package:http/http.dart' as http;

class UserDTO {
  final int userId;
  final String username;
  final String password;
  final String nickname;
  final List<String> authorities;

  UserDTO({
    required this.userId,
    required this.username,
    required this.password,
    required this.nickname,
    required this.authorities,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      userId: json['userId'],
      username: json['username'],
      password: json['password'],
      nickname: json['nickname'],
      authorities: List<String>.from(json['authorities']),
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

Future<void> sendUser(UserDTO user) async {
  final url = Uri.parse(''); //API URL로 변경
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(user.toJson()),
  );

  if (response.statusCode == 200) {
    print('successful');
  } else {
    print('failed: ${response.statusCode}');
  }
}