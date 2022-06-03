import 'package:meta/meta.dart';
import 'dart:convert';


class LegendINFOModel {

  String id;
  String skillName;
  String skill;
  String l2;
  String l3;
  String l4;
  String l5;
  String l6;
  String l7;
  String l8;
  String l9;
  String l10;
  String max;
  LegendINFOModel({
    required this.id,
    required this.skillName,
    required this.skill,
    required this.l2,
    required this.l3,
    required this.l4,
    required this.l5,
    required this.l6,
    required this.l7,
    required this.l8,
    required this.l9,
    required this.l10,
    required this.max,
  });

  factory LegendINFOModel.fromJson(Map<dynamic, dynamic> parsedjson) {
    return LegendINFOModel(
      id: parsedjson["ID"],
      skillName: parsedjson["SkillName"],
      skill: parsedjson["Skill"],
      l2: parsedjson["L2"],
      l3: parsedjson["L3"],
      l4: parsedjson["L4"],
      l5: parsedjson["L5"],
      l6: parsedjson["L6"],
      l7: parsedjson["L7"],
      l8: parsedjson["L8"],
      l9: parsedjson["L9"],
      l10: parsedjson["L10"],
      max: parsedjson["Max"],
    );
  }

}
