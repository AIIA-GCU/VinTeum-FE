import 'package:flutter/material.dart';
import 'package:vinteum/models/team_dto.dart';
import 'package:vinteum/services/api_service.dart';
import 'package:vinteum/main.dart';

class TeamProvider with ChangeNotifier {
  TeamDTO? _team;

  TeamDTO? get team => _team;

  Future<void> fetchTeamData() async {
    try {
      _team = await ApiService().fetchTeamData();
      notifyListeners();
    } catch (error) {
      print('Error: $error');
    }
  }
}
