
import 'dart:convert';
import 'dart:ui';


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:http/http.dart' as http;
import 'package:ochdappupdated/Database.dart';
import 'package:ochdappupdated/LegendTAB.dart';
import 'package:ochdappupdated/models/LegendINFOModel.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

import 'ad_helper.dart';
import 'main.dart';


class DetailPageLegend extends StatefulWidget {
  final String id;
  final String type;
  final String series;
  final String name;
  final String rarity;
  DetailPageLegend(this.id, this.type, this.series, this.name, this.rarity, );



  @override
  State<StatefulWidget> createState(){
    return _DetailPageLegendState(this.id, this.type, this.series, this.name, this.rarity,);
  }
}

class _DetailPageLegendState extends State<DetailPageLegend> {


  String id;
  // TODO: Add _bannerAd
  late BannerAd _bannerAd;

  // TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;
  final String type;
  final String series;
  final String name;
  final String rarity;
  bool isSwitched = Database().responsedarkorlight()?? false;

  // @override bool get wantKeepAlive => true;
  List<LegendINFOModel> _infomodel = [];

  _DetailPageLegendState(this.id, this.type, this.series, this.name, this.rarity);
  Future<String?> getCharDetails() async {
    final response = await 	http.get(Uri.parse("https://ochd.co.uk/api/getlegendinfo.php?ID="+ id));
    final responseJson = json.decode(response.body.toString());

    setState(() {
      for (Map info in responseJson) {
        _infomodel.add(LegendINFOModel.fromJson(info));
      }});

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(



          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_sharp,
                color: Colors.blue
            ),
            onPressed: () => Navigator.pop(context)

          ),
          title: Text(name, textAlign: TextAlign.center,style: TextStyle(color: Colors.blue))

       ),



      body:



          ListView.builder(
          itemCount: _infomodel.length,
            itemBuilder: (context, i) {
              final List<String> imgList = [
                "https://ochd.co.uk/db/puti/Assets/Legend/art/"+_infomodel[i].id.substring(2)+".png",
                "https://ochd.co.uk/db/puti/Assets/Legend/std/"+_infomodel[i].id.substring(2)+".png",

              ];
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
                                imgList.indexOf(item) == 0 ? "Manga Panel 1": "Manga panel 2",
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
                      //   padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 44),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.max,
                      //     children: [
                      //       Expanded(
                      //         child: Image.network(
                      //           "https://ochd.co.uk/db/puti/Assets/Legend/art/"+_infomodel[i].id.substring(2)+".png",
                      //           height: 200,
                      //           width: 300,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 44),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.max,
                      //     children: [
                      //       Expanded(
                      //         child: Image.network(
                      //           "https://ochd.co.uk/db/puti/Assets/Legend/std/"+_infomodel[i].id.substring(2)+".png",
                      //           height: 200,
                      //           width: 300,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children:  [
                    const Text(
                        "Max Rarity: ",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)

                    ),
                    Expanded(
                      child: Text(
                        rarity,

                      ),
                    ),
                  ],
                ),
              ),
                      Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Text(
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 44),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children:  [

                            Text(
                                "Series: ",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                              ),
                        Expanded(
                          child:
                            Text(
                                series,
                              ),
                        ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Skillname: ",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                            ),
                        Expanded(
                          child:
                            Text(
                              _infomodel[i].skillName,
                            ),
                        ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Skill: ",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                            ),
                        Expanded(
                          child:
                            Text(
                                _infomodel[i].skill,
                            ),
                        ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                "Lvl 2:"+_infomodel[i].l2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                "Lvl 3:"+_infomodel[i].l3,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                "Lvl 4:"+_infomodel[i].l4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                "Lvl 5:"+_infomodel[i].l5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                "Lvl 6:"+_infomodel[i].l6,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                "Lvl 7:"+_infomodel[i].l7,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                "Lvl 8:"+_infomodel[i].l8,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                "Lvl 9:"+_infomodel[i].l9,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                "Lvl 10:"+_infomodel[i].l10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Max: ",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                            ),
                        Expanded(
                          child:
                            Text(
                              _infomodel[i].max,
                            ),
                        ),

                          ],
                        ),
                      ),
                      if (_isBannerAdReady)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: _bannerAd.size.width.toDouble(),
                            height: _bannerAd.size.height.toDouble(),
                            child: AdWidget(ad: _bannerAd),
                          ),
                        ),
            ]));
          },
        )



    );
  }

  @override
  void initState() {
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
    getCharDetails();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

}