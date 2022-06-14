
import 'dart:convert';
import 'dart:developer';


import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ochdappupdated/LegendTAB.dart';
import 'package:ochdappupdated/MainOCHDPage.dart';
import 'package:ochdappupdated/chartab.dart';
import 'package:ochdappupdated/models/CharINFOL6.dart';
import 'package:ochdappupdated/models/CharINFOluck.dart';
import 'package:http/http.dart' as http;
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'Database.dart';
import 'ad_helper.dart';
import 'main.dart';
import 'models/CharINFOPassiveskill.dart';
import 'models/CharINFOSkills.dart';

import 'models/CharINFOBuddy.dart';
import 'models/CharINFOStats.dart';
import 'models/CharINFOTransform.dart';

class DetailPage extends StatefulWidget {
  final String passedData;
  final String passedtransform;
  final String passedportrait;
  final String maxrarity;

  final String name;
  final String series;



  final String type;

  final String classs;

  final String era;

  final String method;


  DetailPage(this.passedData, this.passedtransform, this.passedportrait,this.name, this.maxrarity, this.series,  this.type, this.classs, this.era, this.method,);



  @override
  State<StatefulWidget> createState(){
    return _DetailPageState(this.passedData,this.passedtransform,this.passedportrait,this.name, this.maxrarity, this.series, this.type, this.classs, this.era, this.method, );
}
}

class _DetailPageState extends State<DetailPage> {

  String passedportrait;
  String passedData;
  String passedtransform;
  // @override bool get wantKeepAlive => true;
  List<CharINFOStats> _infostats = [];
  String statsAtk = "";
  String statsDef = "";
  String statsHP = "";
  late String skilltext = "";
  late String skilll2 = "";
List<CharINFOBuddy>_infobuddy = [];
  List<CharINFOL6> _infoL6 = [];
  List<CharINFOPassiveskill> _infopaasive = [];
  List<CharINFOluck> _infoluck = [];
  List<CharINFOTransform> _infotransformskill = [];
  List<CharINFOTransform> _infotransformbuddy = [];
  List<CharINFOTransform> _infotransformpassive = [];

  int index = 0;


  late String buddyskill = "";
  late String skilll3 ="";
      late String skilll4 ="";
      late String skilll5 ="";
      late String skilll6 ="";
      late String  skilll7 ="";
      late String skilll8 = "";
  late String skilll9 = "";
  late String skilll10 = "";
  late String skilll11 = "";
  late String skilll12 = "";
  late String skillmax = "";
  late String l6skill = "";
  late String l6buddy = "";
  late String l6passive = "";
  late String l6cooldown = "";
  final _infostatsnew = {};
  final _infobuddynew = {};
  late String  buddyskillname = "";
  late String  buddyl2 ="";
  late String  buddyl3 = "";
  late String  buddyl4 = "";
  late String  buddyl5 = "";
  late String  buddyl6 = "";
  late String  buddyl7 = "";
  late String  buddyl8 = "";
  late String  buddyl9 = "";
  late String   buddyl10 = "";
  late String  buddyl11 = "";
  late String  buddyl12 = "";
  late String  buddymax = "";
  late String  buddybasec = "";
  late String  buddymaxc = "";
  late String paasiveskilltext = "";
  late String passiveskillname = "";
  late String paasiveskilll2 = "";
  late String paasiveskilll3 = "";
  late String paasiveskilll4 = "";
  late String paasiveskilll5 = "";
  late String paasiveskilll6 = "";
  late String paasiveskilll7 = "";
  late String paasiveskilll8 = "";
  late String paasiveskilll9 = "";
  late String paasiveskilll10 = "";
  late String  paasiveskilll11 = "";
  late String paasiveskilll12 = "";
  late String paasiveskillmax = "";
  late String luck10 = "";
  late String luck30 = "";
  late String luck50 = "";
  late String luck75 = "";
  late String luck99 = "";
  final String name;
  final String series;
  late  String TransformSkillName= "";
  late  String TransformSkill= "";
  late  String TransformL1Cooldown= "";
  late  String TransformL2= "";
  late  String TransformL3= "";
  late  String TransformL4= "";
  late  String TransformL5= "";
  late  String TransformL6= "";

  late  String TransformL6Skill= "";
  late  String TransformL6Cooldown= "";
  late  String TransformL7= "";
  late  String TransformL8= "";
  late  String TransformL9= "";
  late  String TransformL10= "";
  late String TransformL11= "";
  late  String TransformL12= "";
  late  String TransformMax= "";
  late  String TransformL12Cooldown= "";
  ///buddy
  late  String TransformSkillNamebuddy= "";
  late  String TransformSkillbuddy= "";
  late  String TransformL1Cooldownbuddy= "";
  late  String TransformL2buddy= "";
  late  String TransformL3buddy= "";
  late  String TransformL4buddy= "";
  late  String TransformL5buddy= "";
  late  String TransformL6buddy= "";

  late  String TransformL6Skillbuddy= "";
  late  String TransformL6Cooldownbuddy= "";
  late  String TransformL7buddy= "";
  late  String TransformL8buddy= "";
  late  String TransformL9buddy= "";
  late  String TransformL10buddy= "";
  late String TransformL11buddy= "";
  late  String TransformL12buddy= "";
  late  String TransformMaxbuddy= "";
  late  String TransformL12Cooldownbuddy= "";
  /// passive
  late  String TransformSkillNamepassive= "";
  late  String TransformSkillpassive= "";
  late  String TransformL1Cooldownpassive= "";
  late  String TransformL2passive= "";
  late  String TransformL3passive= "";
  late  String TransformL4passive= "";
  late  String TransformL5passive= "";
  late  String TransformL6passive= "";

  late  String TransformL6Skillpassive= "";
  late  String TransformL6Cooldownpassive= "";
  late  String TransformL7passive= "";
  late  String TransformL8passive= "";
  late  String TransformL9passive= "";
  late  String TransformL10passive= "";
  late String TransformL11passive= "";
  late  String TransformL12passive= "";
  late  String TransformMaxpassive= "";
  late  String TransformL12Cooldownpassive= "";
  late String skillname="";
  bool toggle1 = false;
  bool toggle2 = false;
  String subID = "";
  final String maxrarity;

  final String type;

  final String classs;

  final String era;

  final String method;

  late String imageurl = "https://ochd.co.uk/db/puti/Assets/std/bt_chara_std_" +
  passedData + ".png";
  late String transformurl = "https://ochd.co.uk/db/puti/Assets/book/bt_chara_book_"+passedData+".png";
  late BannerAd _bannerAd;
  bool isSwitched = Database().responsedarkorlight()?? false;


  // TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;
  List<CharINFOSkills> _infoskills = [];
  _DetailPageState(this.passedData, this.passedtransform, this.passedportrait,this.name, this.maxrarity, this.series,  this.type, this.classs, this.era, this.method, );

  Future<String?> getCharDetailsstats() async {
    final response = await 	http.get(Uri.parse("https://ochd.co.uk/api/getcharinfostats.php?ID="+ passedData));
    final responseJson = json.decode(response.body.toString());

    print(responseJson);
    print(response);
    print("hello");
    setState(() {
      for (Map info in responseJson) {
        _infostats.add(CharINFOStats.fromJson(info));
        _infostatsnew.addAll(info);


      }});
    ///this is interfering with the if in the field

      statsAtk = _infostats[0].ATK;
      statsHP = _infostats[0].HP;
      statsDef = _infostats[0].RCV;
      print(statsDef);
      print(statsAtk);
      print(statsHP);



    print(_infostats.toString());
    print(_infostats.toList());
    inspect(_infostats);
    print(_infostatsnew);
    //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //   List<String> personsEncoded = JumputiChars.map((person) => jsonEncode(person.toJson())).toList();
    // await sharedPreferences.setStringList('accounts', accounts);
  }
  Future<String?> getCharDetailsbuddy() async {
    final response = await 	http.get(Uri.parse("https://ochd.co.uk/api/getcharinfobuddy.php?ID="+ passedData));
    final responseJson = json.decode(response.body.toString());

    print(responseJson);
    print(response);
    print("hello");
    setState(() {
      for (Map info in responseJson) {
        _infobuddy.add(CharINFOBuddy.fromJson(info));
        _infobuddynew.addAll(info);
      }});
    buddyskillname = _infobuddy[0].SKillName;
    buddyskill = _infobuddy[0].Skill;
    buddyl2 = _infobuddy[0].L2;
    buddyl3 = _infobuddy[0].L3;
    buddyl4 = _infobuddy[0].L4;
    buddyl5 = _infobuddy[0].L5;
    buddyl6 = _infobuddy[0].L6;
    buddyl7 = _infobuddy[0].L7;
    buddyl8 = _infobuddy[0].L8;
    buddyl9 = _infobuddy[0].L9;
    buddyl10 = _infobuddy[0].L10;
    buddyl11 = _infobuddy[0].L11;
    buddyl12 = _infobuddy[0].L12;
    buddymax = _infobuddy[0].Max;
    buddybasec = _infobuddy[0].BaseCooldown;
    buddymaxc = _infobuddy[0].MaxCooldown;








  }
  Future<String?> getCharDetailsL6() async {
    final response = await 	http.get(Uri.parse("https://ochd.co.uk/api/getcharinfol6.php?ID="+ passedData));
    final responseJson = json.decode(response.body.toString());

    print(responseJson);
    print(response);
    print("hello");
    setState(() {
      for (Map info in responseJson) {
        _infoL6.add(CharINFOL6.fromJson(info));
      }});
    ///this is interfering with the if in the field
    l6skill = _infoL6[0].Skill;
    l6buddy = _infoL6[0].BuddySkill;
    l6passive = _infoL6[0].Passive;
    l6cooldown = _infoL6[0].Cooldown;
    //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //   List<String> personsEncoded = JumputiChars.map((person) => jsonEncode(person.toJson())).toList();
    // await sharedPreferences.setStringList('accounts', accounts);
  }
  Future<String?> getCharDetailspassive() async {
    final response = await 	http.get(Uri.parse("https://ochd.co.uk/api/getcharinfopassiveskills.php?ID="+ passedData));
    final responseJson = json.decode(response.body.toString());

    print(responseJson);
    print(response);
    print("hello");
    setState(() {
      for (Map info in responseJson) {
        _infopaasive.add(CharINFOPassiveskill.fromJson(info));
      }});
    ///this is interfering with the if in the field
    paasiveskilltext = _infopaasive[0].Skill;
    passiveskillname = _infopaasive[0].SKillName;
    paasiveskilll2 = _infopaasive[0].L2;
    paasiveskilll3 = _infopaasive[0].L3;
    paasiveskilll4 = _infopaasive[0].L4;
    paasiveskilll5 = _infopaasive[0].L5;
    paasiveskilll6 = _infopaasive[0].L6;
    paasiveskilll7 = _infopaasive[0].L7;
    paasiveskilll8 = _infopaasive[0].L8;
    paasiveskilll9 = _infopaasive[0].L9;
    paasiveskilll10 = _infopaasive[0].L10;
    paasiveskilll11 = _infopaasive[0].L11;
    paasiveskilll12 = _infopaasive[0].L12;
    paasiveskillmax = _infopaasive[0].Max;

    //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //   List<String> personsEncoded = JumputiChars.map((person) => jsonEncode(person.toJson())).toList();
    // await sharedPreferences.setStringList('accounts', accounts);
  }
  Future<String?> getCharDetailsluck() async {
    final response = await 	http.get(Uri.parse("https://ochd.co.uk/api/getcharinfoluck.php?ID="+ passedData));
    final responseJson = json.decode(response.body.toString());

    print(responseJson);
    print(response);
    print("hello");
    setState(() {
      for (Map info in responseJson) {
        _infoluck.add(CharINFOluck.fromJson(info));
      }});
    ///this is interfering with the if in the field
    luck10 = _infoluck![0].L10Skill;
    luck30 = _infoluck![0].L30Skill;
    luck50 = _infoluck![0].L50Skill;
    luck75 = _infoluck![0].L75Skill;
    luck99 = _infoluck![0].L99Skill;
    //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //   List<String> personsEncoded = JumputiChars.map((person) => jsonEncode(person.toJson())).toList();
    // await sharedPreferences.setStringList('accounts', accounts);
  }
  Future<String?> getCharDetailsskills() async {
    final response = await 	http.get(Uri.parse("https://ochd.co.uk/api/getcharinfoskills.php?ID="+ passedData));
    final responseJson = json.decode(response.body.toString());

    print(responseJson);
    print(response);
    print("hello");
    setState(() {
      for (Map info in responseJson) {
        _infoskills.add(CharINFOSkills.fromJson(info));
      }});
    ///this is interfering with the if in the field
    skillname = _infoskills![0].SKillName;
    skilltext = _infoskills![0].Skill;
    skilll2 = _infoskills![0].L2;
    skilll3 = _infoskills![0].L3;
    skilll4 = _infoskills![0].L4;
    skilll5 = _infoskills![0].L5;
    skilll6 = _infoskills![0].L6;
    skilll7 = _infoskills![0].L7;
    skilll8 = _infoskills![0].L8;
    skilll9 = _infoskills![0].L9;
    skilll10 = _infoskills![0].L10;
    skilll11 = _infoskills![0].L11;
    skilll12 = _infoskills![0].L12;
    skillmax = _infoskills![0].Max;


    //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //   List<String> personsEncoded = JumputiChars.map((person) => jsonEncode(person.toJson())).toList();
    // await sharedPreferences.setStringList('accounts', accounts);
  }
  Future<String?> gettransform(String subID) async {
    _infotransformskill.clear();
    final responseskilll = await http.get(Uri.parse("https://ochd.co.uk/api/gettransform.php?ID="+ passedData+"&SubID="+subID+"&SkillType=Skill"));
    print(responseskilll);
    final responseJson = json.decode(responseskilll.body.toString());

    final responsebuddy = await http.get(Uri.parse("https://ochd.co.uk/api/gettransform.php?ID="+ passedData+"&SubID="+subID+"&SkillType=BuddySkill"));
    final responseJsonbuddy = json.decode(responsebuddy.body.toString());

    final responsepassive = await http.get(Uri.parse("https://ochd.co.uk/api/gettransform.php?ID="+ passedData+"&SubID="+subID+"&SkillType=PassiveSkill"));
    final responseJsonpassive = json.decode(responsepassive.body.toString());

    print("hello form working");
    setState(() {
      for (Map info in responseJson) {
        _infotransformskill.add(CharINFOTransform.fromJson(info));


      }
      for (Map info in responseJsonbuddy) {
        _infotransformbuddy.add(CharINFOTransform.fromJson(info));


      }
      for (Map info in responseJsonpassive) {
        _infotransformpassive.add(CharINFOTransform.fromJson(info));


      }
    });
    ///this is interfering with the if in the field
    // TODO: Add _bannerAd

    TransformSkillName = _infotransformskill[0].SkillName;
    TransformSkill= _infotransformskill[0].Skill;
     TransformL1Cooldown= _infotransformskill[0].L1Cooldown;
   TransformL2= _infotransformskill[0].L2;
     TransformL3= _infotransformskill[0].L3;
     TransformL4= _infotransformskill[0].L4;
   TransformL5= _infotransformskill[0].L5;
    TransformL6 = _infotransformskill[0].L6;
     TransformL6Skill= _infotransformskill[0].L6Skill;
     TransformL6Cooldown= _infotransformskill[0].L6Cooldown;
   TransformL7= _infotransformskill[0].L7;
    TransformL8= _infotransformskill[0].L8;
    TransformL9= _infotransformskill[0].L9;
    TransformL10= _infotransformskill[0].L10;
     TransformL11= _infotransformskill[0].L11;
    TransformL12= _infotransformskill[0].L12;
     TransformMax= _infotransformskill[0].Max;
   TransformL12Cooldown= _infotransformskill[0].L12Cooldown;
    print(statsDef);
    print(statsAtk);
    print(statsHP);
    TransformSkillNamebuddy = _infotransformbuddy[0].SkillName;
    TransformSkillbuddy= _infotransformbuddy[0].Skill;
    TransformL1Cooldownbuddy= _infotransformbuddy[0].L1Cooldown;
    TransformL2buddy= _infotransformbuddy[0].L2;
    TransformL3buddy= _infotransformbuddy[0].L3;
    TransformL4buddy= _infotransformbuddy[0].L4;
    TransformL5buddy= _infotransformbuddy[0].L5;
    TransformL6buddy = _infotransformbuddy[0].L6;
    TransformL6Skillbuddy= _infotransformbuddy[0].L6Skill;
    TransformL6Cooldownbuddy= _infotransformbuddy[0].L6Cooldown;
    TransformL7buddy= _infotransformbuddy[0].L7;
    TransformL8buddy= _infotransformbuddy[0].L8;
    TransformL9buddy= _infotransformbuddy[0].L9;
    TransformL10buddy= _infotransformbuddy[0].L10;
    TransformL11buddy= _infotransformbuddy[0].L11;
    TransformL12buddy= _infotransformbuddy[0].L12;
    TransformMaxbuddy= _infotransformbuddy[0].Max;
    TransformL12Cooldownbuddy= _infotransformbuddy[0].L12Cooldown;

///passive
    TransformSkillNamepassive = _infotransformpassive[0].SkillName;
    TransformSkillpassive= _infotransformpassive[0].Skill;
    TransformL1Cooldownpassive= _infotransformpassive[0].L1Cooldown;
    TransformL2passive= _infotransformpassive[0].L2;
    TransformL3passive= _infotransformpassive[0].L3;
    TransformL4passive= _infotransformpassive[0].L4;
    TransformL5passive= _infotransformpassive[0].L5;
    TransformL6passive = _infotransformpassive[0].L6;
    TransformL6Skillpassive= _infotransformpassive[0].L6Skill;
    TransformL6Cooldownpassive= _infotransformpassive[0].L6Cooldown;
    TransformL7passive= _infotransformpassive[0].L7;
    TransformL8passive= _infotransformpassive[0].L8;
    TransformL9passive= _infotransformpassive[0].L9;
    TransformL10passive= _infotransformpassive[0].L10;
    TransformL11passive= _infotransformpassive[0].L11;
    TransformL12passive= _infotransformpassive[0].L12;
    TransformMaxpassive= _infotransformpassive[0].Max;
    TransformL12Cooldownpassive= _infotransformpassive[0].L12Cooldown;
    //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //   List<String> personsEncoded = JumputiChars.map((person) => jsonEncode(person.toJson())).toList();
    // await sharedPreferences.setStringList('accounts', accounts);
  }

  Widget checktransfrom(){
    final List<String> imgList = [
      imageurl,
      "https://ochd.co.uk/db/puti/Assets/book/bt_chara_book_"+passedData+".png",
      "https://ochd.co.uk/db/puti/Assets/Art/"+passedportrait,
    ];
    if(passedtransform == "1"){
      final List<Widget> imageSliders = imgList
          .map((item) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, width: 1000.0, height: 1000,),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        imgList.indexOf(item) == 0 ? "Sprite ": imgList.indexOf(item) == 1 ? "Manga": "Portrait",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ))
          .toList();
      return SingleChildScrollView(
          child:SafeArea(

              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1,
                        enlargeCenterPage: true,
                        pauseAutoPlayOnManualNavigate: true,
                      ),
                      items: imageSliders,
                    ),
                  ),
                  // Padding(
                  //     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.max,
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //
                  //         Image.network(
                  //           imageurl,
                  //           height: 150,
                  //           width: 150,),
                  //
                  //         ],
                  //     )
                  // ),
                  // Padding(
                  //     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.max,
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Image.network("https://ochd.co.uk/db/puti/Assets/book/bt_chara_book_"+passedData+".png",
                  //           height: 150,
                  //           width: 150,),
                  //       ],
                  //     )
                  // ),
                  // Padding(
                  //     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.max,
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Image.network("https://ochd.co.uk/db/puti/Assets/Art/"+passedportrait,
                  //           height: 150,
                  //           width: 150,),
                  //       ],
                  //     )
                  // ),

                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              'Name: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                          ),

                          Expanded(child: Text(name)),

                        ],
                      )
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              'Era: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                          ),

                          Expanded(child: Text(era)),

                        ],
                      )
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              'Class: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                          ),

                          Expanded(child: Text(classs)),





                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              'Series: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                          ),

                          Expanded(child: Text(series)),





                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Type: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)




                          ),
                          Image.asset(
                            "assets/images/"+
                                type + ".png",height: 20,width: 20,
                            fit: BoxFit.cover,
                          ),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/detail/hp.png",
                            height: 50,
                            width: 50,
                          ),
                          Text(
                              statsHP
                          ),
                          Image.asset(
                            "assets/detail/atk.png",
                            height: 50,
                            width: 50,
                          ),
                          Text(
                              statsAtk
                          ),
                          Image.asset(
                            "assets/detail/rcv.png",
                            height: 50,
                            width: 50,
                          ),
                          Text(
                              statsDef
                          ),
                        ],
                      )
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
    Expanded(child:Text("This unit can switch between forms. Click the button in game to switch")),






                        ],
                      )),

                  Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        SizedBox(
    width: 150.0,
    height: 150.0,
    child:

                              IconButton(
                                  icon: toggle1
                                      ? Image.asset("assets/detail/form1on.png",)
                                      : Image.asset("assets/detail/form1off.png", ),

                                  onPressed: () {  setState(() {
                                    // Here we changing the icon.
                                    if(toggle1 == true){
                                      print("toggle true");
                                      toggle1 = false;
                                      toggle2 = false;
                                      subID = "";

                                      imageurl = "https://ochd.co.uk/db/puti/Assets/std/bt_chara_std_" +
                                          passedData + ".png";
                                    }
                                    else{
                                      print("toggle false");
                                      toggle1 = !toggle1;
                                      toggle2 = false;
                                      subID = "01";
                                      print(subID);
                                      if(subID == "01") {
                                        gettransform(subID);
                                        imageurl =
                                            "https://ochd.co.uk/db/puti/Assets/std/bt_chara_std_" +
                                                passedData + "_00_01.png";
                                      }
                                    }



                                  }); }),

                          ),
    SizedBox(
    width: 150.0,
    height: 150.0,
    child:

                              IconButton(
                                  icon: toggle2
                                      ? Image.asset("assets/detail/form2on.png", )
                                      : Image.asset("assets/detail/form2off.png", ),

                                  onPressed: () {   setState(() {
                                    // Here we changing the icon.
                                    if(toggle2 == true) {
                                      toggle2 = false;
                                      toggle1 = false;
                                      subID = "";
                                      print("toggle true");

                                      imageurl = "https://ochd.co.uk/db/puti/Assets/std/bt_chara_std_" +
                                          passedData + ".png";

                                    }
                                    else{
                                      print("toggle false");

                                      toggle2 = !toggle2;
                                      toggle1 = false;
                                      subID = "02";
                                      print(subID);

                                      if(subID == "02") {
                                        print("running the get");
                                        gettransform(subID);
                                        imageurl =
                                            "https://ochd.co.uk/db/puti/Assets/std/bt_chara_std_" +
                                                passedData + "_00_02.png";
                                      }
                                    }


                                  });}),

                          ),



                        ],
                      ),
                  if(subID == "01")...[

                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Image.asset(
                              "assets/detail/UltimateAttack.png",
                              height: 100,
                              width: 300,
                            ),

                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                             Text(
                                TransformSkillName,textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                            ),



                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Expanded(child: Text(TransformSkill+"(Cooldown: " +TransformL1Cooldown+" turns)")),

                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL2)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL3)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL4)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL5)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL6)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL6Skill +"(Cooldown: " +TransformL6Cooldown+" turns)")),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL7)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL8)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL9)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL10)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL11)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL12)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                                'Max: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                            ),

                            Expanded(child: Text(TransformMax +"(Cooldown: " +TransformL12Cooldown+" turns)")),


                          ],
                        )),

                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Image.asset(
                              "assets/detail/BuddySkill.png",
                              height: 100,
                              width: 300,
                            ),

                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                                TransformSkillNamebuddy,textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                            ),



                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Expanded(child: Text(TransformSkillbuddy+"(Cooldown: " +TransformL1Cooldownbuddy+" turns)")),

                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL2buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL3buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL4buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL5buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL6buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL6Skillbuddy +"(Cooldown: " +TransformL6Cooldownbuddy+" turns)")),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL7buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL8buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL9buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL10buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL11buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL12buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                                'Max: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                            ),

                            Expanded(child: Text(TransformMaxbuddy +"(Cooldown: " +TransformL12Cooldownbuddy+" turns)")),


                          ],
                        )),

                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Image.asset(
                              "assets/detail/PassiveSkill.png",
                              height: 100,
                              width: 300,
                            ),

                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                                TransformSkillNamepassive,textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                            ),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Expanded(child: Text(TransformSkillpassive+"(Cooldown: " +TransformL1Cooldownpassive+" turns)")),

                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL2passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL3passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL4passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL5passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL6passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL6Skillpassive +"(Cooldown: " +TransformL6Cooldownpassive+" turns)")),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL7passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL8passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL9passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL10passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL11passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL12passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 30),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                                'Max: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                            ),

                            Expanded(child: Text(TransformMaxpassive +"(Cooldown: " +TransformL12Cooldownpassive+" turns)")),


                          ],
                        )),


                  ],
                  if(subID == "02")...[

                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Image.asset(
                              "assets/detail/UltimateAttack.png",
                              height: 100,
                              width: 300,
                            ),

                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                             Text(
                                TransformSkillName,textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                            ),




                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Expanded(child: Text(TransformSkill+"(Cooldown: " +TransformL1Cooldown+" turns)")),

                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL2)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL3)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL4)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL5)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL6)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL6Skill +"(Cooldown: " +TransformL6Cooldown+" turns)")),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL7)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL8)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL9)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL10)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL11)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL12)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                                'Max: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                            ),

                            Expanded(child: Text(TransformMax +"(Cooldown: " +TransformL12Cooldown+" turns)")),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Image.asset(
                              "assets/detail/BuddySkill.png",
                              height: 100,
                              width: 300,
                            ),

                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                                TransformSkillNamebuddy,textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                            ),



                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Expanded(child: Text(TransformSkillbuddy+"(Cooldown: " +TransformL1Cooldownbuddy+" turns)")),

                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL2buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL3buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL4buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL5buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL6buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL6Skillbuddy +"(Cooldown: " +TransformL6Cooldownbuddy+" turns)")),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL7buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL8buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL9buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL10buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL11buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL12buddy)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                                'Max: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                            ),

                            Expanded(child: Text(TransformMaxbuddy +"(Cooldown: " +TransformL12Cooldownbuddy+" turns)")),


                          ],
                        )),

                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Image.asset(
                              "assets/detail/PassiveSkill.png",
                              height: 100,
                              width: 300,
                            ),

                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                             Text(
                          TransformSkillNamepassive,textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                            ),




                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Expanded(child: Text(TransformSkillpassive+"(Cooldown: " +TransformL1Cooldownpassive+" turns)")),

                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL2passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL3passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL4passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL5passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL6passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL6Skillpassive +"(Cooldown: " +TransformL6Cooldownpassive+" turns)")),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL7passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL8passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL9passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL10passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL11passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(child: Text(TransformL12passive)),


                          ],
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 30),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                                'Max: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                            ),

                            Expanded(child: Text(TransformMaxpassive +"(Cooldown: " +TransformL12Cooldownpassive+" turns)")),


                          ],
                        )),


                  ],

                ],

              ),

          ));

    }

    else if (passedtransform == "0"){
      final List<Widget> imageSliders = imgList
          .map((item) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, width: 1000.0, height: 1000,),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        imgList.indexOf(item) == 0 ? "Sprite ": imgList.indexOf(item) == 1 ? "Manga": "Portrait",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ))
          .toList();
      return SingleChildScrollView(

          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1,
                      enlargeCenterPage: true,
                      pauseAutoPlayOnManualNavigate: true,
                    ),
                    items: imageSliders,
                  ),
                ),
                // Padding(
                //     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.max,
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Image.network("https://ochd.co.uk/db/puti/Assets/std/bt_chara_std_"+passedData+".png",
                //           height: 150,
                //           width: 150,),
                //       ],
                //     )
                // ),
                // Padding(
                //     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.max,
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Image.network("https://ochd.co.uk/db/puti/Assets/book/bt_chara_book_"+passedData+".png",
                //           height: 150,
                //           width: 150,),
                //       ],
                //     )
                // ),
                // Padding(
                //     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.max,
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Image.network("https://ochd.co.uk/db/puti/Assets/Art/"+passedportrait,
                //           height: 150,
                //           width: 150,),
                //       ],
                //     )
                // ),

                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                            'Name: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                        ),

                        Expanded(child: Text(name)),

                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                            'Era: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                        ),

                        Expanded(child: Text(era)),

                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                            'Class: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                        ),

                        Expanded(child: Text(classs)),





                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        const Text(
                            'Series: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                        ),

                        Expanded(child: Text(series)),




                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [


                        Text(
                          'Type: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),

                        ),
                        Image.asset(
                          "assets/images/"+
                              type + ".png",height: 20,width: 20,
                          fit: BoxFit.cover,
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/detail/hp.png",
                          height: 50,
                          width: 50,
                        ),
                        Text(
                            statsHP
                        ),
                        Image.asset(
                          "assets/detail/atk.png",
                          height: 50,
                          width: 50,
                        ),
                        Text(
                            statsAtk
                        ),
                        Image.asset(
                          "assets/detail/rcv.png",
                          height: 50,
                          width: 50,
                        ),
                        Text(
                            statsDef
                        ),
                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/detail/UltimateAttack.png",
                          height: 100,
                          width: 300,
                        ),

                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(skillname,textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),


                      ],
                    )),

                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Text(skilltext)),



                  ],
                )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Expanded(child: Text(skilll2)),


                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Expanded(child: Text(skilll3)),



                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Expanded(child: Text(skilll4)),



                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Expanded(child: Text(skilll5)),


                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Expanded(child: Text(skilll6)),


                      ],
                    )),
                if(l6skill.isNotEmpty)...[
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(l6skill)),


                        ],
                      ))
                ],
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Expanded(child: Text(skilll7)),


                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Expanded(child: Text(skilll8)),

                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Expanded(child: Text(skilll9)),


                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Expanded(child: Text(skilll10)),


                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Expanded(child: Text(skilll11)),


                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Expanded(child: Text(skilll12)),



                      ],
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const Text(
                            'Max: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                        ),


                        Expanded(child: Text(skillmax)),


                      ],
                    )),


                if(buddyskill.isNotEmpty)...[
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/detail/BuddySkill.png",
                            height: 100,
                            width: 300,
                          ),

                        ],
                      )
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              buddyskillname,textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                          ),



                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(buddyskill +"(Cooldown: " +buddybasec+" turns)")),


                        ],
                      )),

                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(buddyl2)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(buddyl3)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(buddyl4)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(buddyl5)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(buddyl6)),


                        ],
                      )),
                  if(l6buddy.isNotEmpty)...[
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Expanded(child: Text(l6buddy +"(Cooldown: " +l6cooldown+" turns)")),


                          ],
                        )),
                  ],
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(buddyl7)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(buddyl8)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(buddyl9)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(buddyl10)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(buddyl11)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(buddyl12)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 30),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              'Max: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                          ),




                          Expanded(child: Text(buddymax+"(Cooldown: " +buddymaxc+" turns)")),


                        ],
                      )),

                ]
                ,if(paasiveskilltext.isNotEmpty)...[
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/detail/PassiveSkill.png",
                            height: 100,
                            width: 300,
                          ),

                        ],
                      )
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                        passiveskillname,textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                          ),




                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(paasiveskilltext)),


                        ],
                      )),

                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(paasiveskilll2)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(paasiveskilll3)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(paasiveskilll4)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(paasiveskilll5)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(paasiveskilll6)),


                        ],
                      )),
                  if(l6passive.isNotEmpty)...[
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Expanded(child: Text(l6passive)),


                          ],
                        )),
                  ],
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(paasiveskilll7)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(paasiveskilll8)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(paasiveskilll9)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(paasiveskilll10)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(paasiveskilll11)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text(paasiveskilll12)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 30),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              'Max: ',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                          ),

                          Expanded(child: Text(paasiveskillmax)),


                        ],
                      )),

                ]
                ,if(luck10.isNotEmpty)...[
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/detail/LuckSkills.png",
                            height: 100,
                            width: 300,
                          ),

                        ],
                      )
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text("Lvl 10:"+luck10)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text("Lvl 30:"+luck30)),


                        ],
                      )),

                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text("Lvl 50:"+luck50)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text("Lvl 75:"+luck75)),


                        ],
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(child: Text("Lvl 99:"+luck99)),


                        ],
                      )),

                ]


               , if (_isBannerAdReady)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: _bannerAd.size.width.toDouble(),
                      height: _bannerAd.size.height.toDouble(),
                      child: AdWidget(ad: _bannerAd),
                    ),
                  ),
              ]

          ),

      );

    }
  else{
      return SizedBox(
        height: MediaQuery.of(context).size.height / 1.3,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          
        Scaffold(

            appBar: AppBar(

                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_sharp,
                        color: Colors.blue
                    ),
                    onPressed: () => Navigator.pop(context)
                ),
                title: Text(name, textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue))

             ),



            body: checktransfrom(),







        ),

    );



  }
  @override
  void initState() {
    if(passedtransform == "0") {
      getCharDetailsbuddy();
      getCharDetailsstats();
      getCharDetailsL6();
      getCharDetailsluck();
      getCharDetailspassive();
      getCharDetailsskills();
    }
    else if(passedtransform == "1"){
      getCharDetailsstats();

    }
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
            print("addd is ready");
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();

    super.dispose();
  }



}