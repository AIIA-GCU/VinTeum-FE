import 'dart:async';
import 'package:provider/provider.dart';
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
          final jwtToken = JwtToken.fromJson(response['body']);
          final sessionProvider = SessionProvider();
          await sessionProvider.saveJwtToken(jwtToken);
          print('JWT Token successfully saved.');

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

  static Future<Map<String, dynamic>?> createTeam(
      {required String teamName}) async {
    try {
      final api = APIRequest('/team/create');
      Map<String, dynamic> response =
      await api.send(HTTPMethod.post, params: {
        'teamName': teamName,
      }) ?? {};
      if (response['status'] == 200) return response['body'];
      return null;
    } on TimeoutException {
      throw TimeoutException('transmission rate is too slow!');
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>?> joinTeam(
      {required String joinCode}) async {
    try {
      final api = APIRequest('/team/join');
      Map<String, dynamic> response =
          await api.send(HTTPMethod.post, params: {
            'joinCode': joinCode,
          }) ?? {};
      if (response['status'] == 200) return response['body'];
      return null;
    } on TimeoutException {
      throw TimeoutException('transmission rate is too slow!');
    } catch (e) {
      rethrow;
    }
  }

  static Future<String?> loadUsername() async {
    try {
      final api = APIRequest('/user/nickname');
      Map<String, dynamic> response = await api.send(HTTPMethod.get) ?? {};
      if (response['status'] == 200) return response['body']['nickname'].toString();
      return null;
    } on TimeoutException {
      throw TimeoutException('transmission rate is too slow!');
    } catch (e) {
      rethrow;
    }
  }

  static Future<NickNameResponseDTO?> changeUsername(
      {required String newNickName}) async {
    try {
      final api = APIRequest('/user/nickname');
      Map<String, dynamic> response =
          await api.send(HTTPMethod.put, params: {
            'newNickName': newNickName,
          }) ?? {};
      if (response['status'] == 200) return response['body'];
      return null;
    } on TimeoutException {
      throw TimeoutException('transmission rate is too slow!');
    } catch (e) {
      rethrow;
    }
  }
}

