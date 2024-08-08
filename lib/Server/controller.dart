import 'dart:async';
import 'package:vinteum/Server/rest_api.dart';
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
      }) ?? {};
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
}