import 'package:flutter/material.dart';
import 'package:vinteum/models/user_dto.dart';
import 'package:vinteum/services/api_service.dart';
import 'package:vinteum/main.dart';

class UserProvider with ChangeNotifier {
  UserDTO? _user;

  UserDTO? get user => _user;

  Future<void> fetchUserData() async {
    try {
      _user = await ApiService().fetchUserData();
      notifyListeners();
    } catch (error) {
      print('Error: $error');
    }
  }
}
