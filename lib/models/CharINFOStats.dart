import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class CharINFOStats{

  final String HP;
  final String ATK;
  final String RCV;



  CharINFOStats(
      {required this.HP, required this.ATK, required this.RCV,});

  factory CharINFOStats.fromJson(Map<dynamic, dynamic> parsedjson) {
    return CharINFOStats(
        HP: parsedjson['HP'],
        ATK: parsedjson['ATK'],
        RCV: parsedjson['RCV'],


    );

  }



}