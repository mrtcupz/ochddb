import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:hive/hive.dart';


class JumputiChars extends HiveObject{

  final String maxrarity;

  final String name;

  String series;

  final String portrait;

  final String type;

  final String classs;

  final String era;

  final String grade;
  final String method;
  final String ID;
  final String Transform;


  JumputiChars(
      {required this.Transform,required this.maxrarity, required this.name, required this.series, required this.portrait, required this.type, required this.classs,required this.era, required this.method, required this.ID,required this.grade});

  factory JumputiChars.fromJson(Map<dynamic, dynamic> parsedjson) {
    return JumputiChars(
        ID: parsedjson['ID'],
        name: parsedjson['Name'],
        series: parsedjson['Series'],
        maxrarity: parsedjson['MaxRarity'],
        portrait: parsedjson['Portrait'],
        type: parsedjson['Type'],
        classs: parsedjson['Class'],
        era: parsedjson['Era'],
        grade: parsedjson['Grade'],
        method: parsedjson['Method'],
        Transform: parsedjson['Transform'],

    );

  }

  Map<dynamic, dynamic> toJson() {

    return {

      'Class':classs,
      'Series':series,
      'Type': type,
      'MaxRarity': maxrarity,
      'Portrait': portrait,
      'Era': era,
      'Grade': grade,
      'Name': name,
      'ID': ID,
      'Methos': method,
      'Transform': Transform,

       };
  }


}