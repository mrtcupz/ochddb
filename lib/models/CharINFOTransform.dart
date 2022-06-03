import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class CharINFOTransform{

  final String ID;
  final String SkillType;
  final String SkillName;
  final String Skill;
  final String L1Cooldown;
  final String L2;
  final String L3;
  final String L4;
  final String L5;
  final String L6;
  final String L6Skill;
  final String L6Cooldown;
  final String L7;
  final String L8;
  final String L9;
  final String L10;
  final String L11;
  final String L12;
  final String Max;
  final String L12Cooldown;






  CharINFOTransform(
      {required this.ID, required this.SkillType, required this.SkillName, required this.Skill, required this.L1Cooldown, required this.L2, required this.L3, required this.L4, required this.L5, required this.L6,  required this.L6Skill, required this.L6Cooldown, required this.L7, required this.L8, required this.L9, required this.L10, required this.L11, required this.L12, required this.Max, required this.L12Cooldown,});

  factory CharINFOTransform.fromJson(Map<dynamic, dynamic> parsedjson) {
    return CharINFOTransform(
      ID: parsedjson['ID'],
      SkillType: parsedjson['SkillType'],
      SkillName: parsedjson['SkillName'],
      Skill: parsedjson['Skill'],
      L1Cooldown: parsedjson["L1Cooldown"],
      L2: parsedjson["L2"],
      L3: parsedjson["L3"],
      L4: parsedjson["L4"],
      L5: parsedjson["L5"],
      L6: parsedjson["L6"],
      L6Skill: parsedjson["L6Skill"],
      L6Cooldown: parsedjson["L6Cooldown"],
      L7: parsedjson["L7"],
      L8: parsedjson["L8"],
      L9: parsedjson["L9"],
      L10: parsedjson["L10"],
      L11: parsedjson["L11"],
      L12: parsedjson["L12"],
      Max: parsedjson['Max'],
      L12Cooldown: parsedjson["L12Cooldown"],



    );

  }



}