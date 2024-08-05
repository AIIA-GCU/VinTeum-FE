import 'dart:ffi';

import 'package:flutter/foundation.dart';

class TeamDTO {
  final Long teamId;
  final String teamName;
  final String joinCode;
  final int leaderId;
  final String groupSchedule;


  TeamDTO({
    required this.teamId,
    required this.teamName,
    required this.joinCode,
    required this.leaderId,
    required this.groupSchedule,
  });

  // Factory method to create a UserDTO from JSON
  factory TeamDTO.fromJson(Map<String, dynamic> json) {
    return TeamDTO(
      teamId: json['teamId'],
      teamName: json['teamName'],
      joinCode: json['joinCode'],
      leaderId: json['leaderId'],
      groupSchedule: json['groupSchedule'],
    );
  }

  // Method to convert a UserDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'teamId': teamId,
      'teamName': teamName,
      'joinCode': joinCode,
      'leaderId': leaderId,
      'groupSchedule': groupSchedule,
    };
  }
}