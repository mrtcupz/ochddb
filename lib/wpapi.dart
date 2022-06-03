import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ochdappupdated/MainOCHDPage.dart';
import 'package:ochdappupdated/chartab.dart';

Future<List> fetchWpPosts() async{
  final response = await http.get(Uri.parse('https://ochd.co.uk//wp-json/wp/v2/posts?_fields=author,id,excerpt,title,link'));
  var convert = jsonDecode(response.body);
  return convert;
}
Future<List> fetchcontent(idnew) async{

  final response = await http.get(Uri.parse('https://ochd.co.uk//wp-json/wp/v2/posts?include[]='+ idnew));
  var convert = jsonDecode(response.body);
  return convert;
}
Future<List> fetchabout() async{

  final response = await http.get(Uri.parse('https://ochd.co.uk//wp-json/wp/v2/pages?include[]=14104'));
  var convert = jsonDecode(response.body);
  return convert;
}
Future<List> fetchguides() async{

  final response = await http.get(Uri.parse('https://ochd.co.uk//wp-json/wp/v2/pages?include[]=4333'));
  var convert = jsonDecode(response.body);
  return convert;
}
Future<List> fetchlink(String link) async{

  final response = await http.get(Uri.parse("https://ochd.co.uk//wp-json/wp/v2/pages?search="+link));
  var convert = jsonDecode(response.body);
  return convert;
}
Future<List> fetchurl(String link, String postorpage) async{
  link = link.substring(0, link.length -1);
  print(link);
  print(postorpage);

  final response = await http.get(Uri.parse("https://ochd.co.uk//wp-json/wp/v2/"+postorpage+"?slug="+link));
  var convert = jsonDecode(response.body);
  return convert;
}
List<Widget> _buildScreens() {
  return [
    MainOCHDPage(),
    Chartab()

  ];
}