import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class Legend{

  final String ID;
  final String Name;
  final String Series;
  final String Type;

  final String Rarity;


  Legend({required this.ID, required this.Name, required this.Series, required this.Type, required this.Rarity,});

  factory Legend.fromJson(Map<dynamic, dynamic> parsedjson) {
    return Legend(
      ID: parsedjson['ID'],
      Name: parsedjson['Name'],
      Series: parsedjson['Series'],
      Type: parsedjson['Type'],
      Rarity: parsedjson['Rarity'],


    );

  }

  Map<dynamic, dynamic> toJson() {

    return {

      'ID':ID,
      'Name':Name,
      'Series': Series,
      'Type': Type,
      'Rarity': Rarity,

    };
  }

}