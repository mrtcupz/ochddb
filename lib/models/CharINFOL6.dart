import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class CharINFOL6{

  final String Skill;
  final String BuddySkill;
  final String Cooldown;
  final String Passive;



  CharINFOL6(
      {required this.Skill, required this.BuddySkill, required this.Cooldown, required this.Passive,
      });

  factory CharINFOL6.fromJson(Map<dynamic, dynamic> parsedjson) {
    return CharINFOL6(
      Skill: parsedjson['Skill'],
      BuddySkill: parsedjson['BuddySkill'],
      Cooldown: parsedjson['Cooldown'],
      Passive: parsedjson['Passive'],

    );
  }
}