import 'package:flutter/foundation.dart';

class UserDTO {
  final int userId;
  final String username;
  final String password;
  final String nickname;
  final String userSchedule;
  final List<String> authorities;

  UserDTO({
    required this.userId,
    required this.username,
    required this.password,
    required this.nickname,
    required this.userSchedule,
    required this.authorities,
  });

  // Factory method to create a UserDTO from JSON
  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      userId: json['userId'],
      username: json['username'],
      password: json['password'],
      nickname: json['nickname'],
      userSchedule: json['userSchedule'],
      authorities: List<String>.from(json['authorities']),
    );
  }

  // Method to convert a UserDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'password': password,
      'nickname': nickname,
      'userSchedule': userSchedule,
      'authorities': authorities,
    };
  }
}