import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'user_dto.dart';

class JwtToken {
  final String grantType;
  final String accessToken;
  final String refreshToken;

  JwtToken({required this.grantType, required this.accessToken, required this.refreshToken});

  factory JwtToken.fromJson(Map<String, dynamic> json) {
    return JwtToken(
      grantType: json['grantType'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'grantType': grantType,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}

class SessionProvider with ChangeNotifier {
  JwtToken? _jwtToken;
  UserDTO? _user;

  JwtToken? get jwtToken => _jwtToken;
  UserDTO? get user => _user;

  Future<void> saveJwtToken(JwtToken token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwtToken', jsonEncode(token.toJson()));
    _jwtToken = token;
    notifyListeners();
  }

  Future<void> loadJwtToken() async {
    final prefs = await SharedPreferences.getInstance();
    final tokenString = prefs.getString('jwtToken');
    if (tokenString != null) {
      final Map<String, dynamic> tokenJson = jsonDecode(tokenString);
      _jwtToken = JwtToken.fromJson(tokenJson);
      notifyListeners();
    }
  }
  Future<void> deleteJwtToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwtToken');
    _jwtToken = null; //
    notifyListeners(); //
  }

  Future<void> saveUser(UserDTO user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(user.toJson()));
    _user = user;
    notifyListeners();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');
    if (userString != null) {
      final Map<String, dynamic> userJson = jsonDecode(userString);
      _user = UserDTO.fromJson(userJson);
      notifyListeners();
    }
  }
}
