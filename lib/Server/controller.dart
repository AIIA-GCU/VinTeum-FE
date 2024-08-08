import 'dart:async';
import 'package:vinteum/Server/rest_api.dart';
import 'package:vinteum/Server/session.dart';
import 'user_dto.dart';

class RestAPI {
  RestAPI._();

  static Future<UserDTO> tryRegister({
    required String password,
    required String username,
    required String nickname,
  }) async {
    try {
      final api = APIRequest('/user/join');
      Map<String, dynamic> response = await api.send(HTTPMethod.post, params: {
            "username": username,
            "password": password,
            "nickname": nickname,
          }) ??
          {};
      switch (response['status']) {
        case 200:
          return UserDTO.fromJson(response['body']);
        case 400:
          throw 400;
        default:
          throw Exception("[Error] 알 수 없는 이유로 회원가입 할 수 없습니다!");
      }
    } on TimeoutException {
      throw TimeoutException('transmission rate is too slow!');
    } catch (e) {
      rethrow;
    }
  }

  static Future<JwtToken> signIn({
    required String userId,
    required String pw,
  }) async {
    try {
      final api = APIRequest('/user/login');
      Map<String, dynamic> response = await api.send(HTTPMethod.post, params: {
        "loginId": userId,
        "password": pw,
      }) ?? {};
      switch (response['status']) {
        case 200:
          return JwtToken.fromJson(response['body']);
        case 400:
          throw 400;
        default:
          throw Exception("[Error] 알 수 없는 이유로 로그인 할 수 없습니다!");
      }
    } on TimeoutException {
      throw TimeoutException('transmission rate is too slow!');
    } catch (e) {
      rethrow;
    }
  }
}
