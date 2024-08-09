import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:vinteum/Server/session.dart';

enum HTTPMethod { get, post, patch, put, delete }

class APIRequest {
  static const String _baseUrl = "http://210.102.178.161:8081";

  late String _path;

  APIRequest(this._path);

  String get path => _path;

  set setPath(String val) => _path = val;

  Future<dynamic> send(HTTPMethod method, {Map<String, dynamic>? params}) async {
    try {
      final uri = Uri.parse(_baseUrl + _path);
      http.Request request;

      switch (method) {
        case HTTPMethod.get:
          request = http.Request('GET', uri);
          break;
        case HTTPMethod.post:
          request = http.Request('POST', uri);
          break;
        case HTTPMethod.patch:
          request = http.Request('PATCH', uri);
          break;
        case HTTPMethod.put:
          request = http.Request('PUT', uri);
          break;
        case HTTPMethod.delete:
          request = http.Request('DELETE', uri);
          break;
      }

      final headers = {
        'User-Agent': 'VinTeum/1.0.0',
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final sessionProvider = SessionProvider();
      await sessionProvider.loadJwtToken(); // 토큰을 로드
      final jwtToken = sessionProvider.jwtToken;

      if (jwtToken != null) {
        headers['Authorization'] = 'Bearer ${jwtToken.accessToken}';
      }

      request.headers.addAll(headers);

      if (params != null) request.body = jsonEncode(params);

      final httpReturned = await http.Client()
          .send(request).timeout(const Duration(seconds: 15));
      final response = await http.Response.fromStream(httpReturned);

      debugPrint("[api] path : ~$_path");

      if (httpReturned.statusCode != 500) {
        dynamic jsonResponse = response.bodyBytes.isNotEmpty
            ? json.decode(utf8.decode(response.bodyBytes))
            : null;
        jsonResponse = {"body": jsonResponse};

        if (httpReturned.statusCode == 200) {
          jsonResponse['status'] = 200;
          debugPrint("[api] success receiving data (200)");
        } else {
          jsonResponse['status'] = 400;
          debugPrint("[api] client error (400)");
        }

        debugPrint("[api] returned: ${jsonResponse.toString()}");
        return jsonResponse;
      } else {
        debugPrint('[api] server error (500)');
        return {'status': 500};
      }
    } on TimeoutException {
      throw TimeoutException('[Error] api send: timeout');
    } catch (e) {
      throw '\n[Error] api send:$e';
    }
  }
}
