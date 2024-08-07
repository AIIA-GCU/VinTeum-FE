import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vinteum/models/user_dto.dart';
import 'package:vinteum/models/team_dto.dart';

class ApiService {
  final String Url = 'our api'; // API URL 등록하기

  // userDTO 관련
  Future<UserDTO> fetchUserData() async {
    final response = await http.get(Uri.parse('$Url/user'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return UserDTO.fromJson(data);
    } else {
      throw Exception('Failed to load user data');
    }
  }

// teamDTO 관련
  Future<TeamDTO> fetchTeamData() async {
    final response = await http.get(Uri.parse('$Url/team'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return TeamDTO.fromJson(data);
    } else {
      throw Exception('Failed to load team data');
    }
  }
}