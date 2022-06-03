import 'package:shared_preferences/shared_preferences.dart';


class CharINFOPassiveskill{

  final String SKillName;
  final String Skill;
  final String L2;
  final String L3;
  final String L4;
  final String L5;
  final String L6;
  final String L7;
  final String L8;
  final String L9;
  final String L10;
  final String L11;
  final String L12;
  final String Max;



  CharINFOPassiveskill(
      {required this.SKillName, required this.Skill, required this.L2, required this.L3, required this.L4, required this.L5, required this.L6, required this.L7, required this.L8, required this.L9, required this.L10, required this.L11, required this.L12, required this.Max,
      });

  factory CharINFOPassiveskill.fromJson(Map<dynamic, dynamic> parsedjson) {
    return CharINFOPassiveskill(
      SKillName: parsedjson['SkillName']?? '0',
      Skill: parsedjson['Skill']?? '0',
      L2: parsedjson['L2']?? '0',
      L3: parsedjson['L3']?? '0',
      L4: parsedjson['L4']?? '0',
      L5: parsedjson['L5']?? '0',
      L6: parsedjson['L6']?? '0',
      L7: parsedjson['L7']?? '0',
      L8: parsedjson['L8']?? '0',
      L9: parsedjson['L9']?? '0',
      L10: parsedjson['L10']?? '0',
      L11: parsedjson['L11']?? '0',
      L12: parsedjson['L12']?? '0',
      Max: parsedjson['Max']?? '0',


    );
  }
  }
