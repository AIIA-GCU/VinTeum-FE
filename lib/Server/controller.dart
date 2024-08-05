import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'session.dart';

class LoginRequest {
  final String loginId;
  final String password;

  LoginRequest({required this.loginId, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'loginId': loginId,
      'password': password,
    };
  }
}

class signUpRequest {

}

class AuthProvider with ChangeNotifier {
  Future<void> login(String loginId, String password) async {
    final url = Uri.parse(''); // API URL로 변경
    final loginRequest = LoginRequest(loginId: loginId, password: password);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginRequest.toJson()),
    );

    if (response.statusCode == 200) {
      // 로그인 성공
      final tokenJson = jsonDecode(response.body);
      final jwtToken = JwtToken.fromJson(tokenJson);
      await SessionProvider().saveJwtToken(jwtToken);
      print('Login successful');
      notifyListeners();
    } else {
      // 로그인 실패
      print('Login failed: ${response.statusCode}');
    }
  }
}
