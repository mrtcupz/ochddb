import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class CharINFOBuddy{

  final String SKillName,Skill,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12,Max;
  final String BaseCooldown;
  final String MaxCooldown;


  CharINFOBuddy(
      {required this.SKillName, required this.BaseCooldown,required this.Skill, required this.L2, required this.L3, required this.L4, required this.L5, required this.L6, required this.L7, required this.L8, required this.L9, required this.L10, required this.L11, required this.L12, required this.Max, required this.MaxCooldown
      });

  factory CharINFOBuddy.fromJson(Map<dynamic, dynamic> parsedjson) {
    return CharINFOBuddy(
      SKillName: parsedjson['SkillName'],
      Skill: parsedjson['Skill'],
      BaseCooldown: parsedjson['BaseCooldown'],
      L2: parsedjson['L2'],
      L3: parsedjson['L3'],
      L4: parsedjson['L4'],
      L5: parsedjson['L5'],
      L6: parsedjson['L6'],
      L7: parsedjson['L7'],
      L8: parsedjson['L8'],
      L9: parsedjson['L9'],
      L10: parsedjson['L10'],
      L11: parsedjson['L11'],
      L12: parsedjson['L12'],
      Max: parsedjson['Max'],
      MaxCooldown: parsedjson['MaxCooldown'],


    );
  }
  }