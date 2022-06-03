import 'dart:convert';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:html/dom.dart' as dom;
import 'package:flutter_html/flutter_html.dart';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ochdappupdated/clickedlink.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:url_launcher/url_launcher.dart';


import 'CustomAppBar.dart';
import 'Database.dart';
import 'ad_helper.dart';
import 'main.dart';
import 'wpapi.dart';

class guides extends StatefulWidget {

  _guidesState createState() => _guidesState();
}
class Linkpulledin {
  final String href;
  Linkpulledin({required this.href});

  factory Linkpulledin.fromJson(Map<dynamic, dynamic> parsedjson) {
    return Linkpulledin(
      href: parsedjson['href']


    );

  }
}
class _guidesState extends State<guides> {
  // TODO: Add _bannerAd
  late BannerAd _bannerAd;
  bool isSwitched = Database().responsedarkorlight()?? false;

  // TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;
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
    super.initState();
  }
  @override
  void dispose() {
    // myBanner.dispose();
    _bannerAd.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Guides"),



      body: Stack(
        children: [
          FutureBuilder(
            future: fetchguides(),
            builder: (context, AsyncSnapshot snapshot){

              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index){
                      Map wppost = snapshot.data[index];
                      Widget html = Html(
                        data:
                        wppost['content']['rendered'],
                          onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, dom.Element? element) async {
                            print("tapped");
                            print(url);
                            String? urlnew = url;
                            String postorpage = "";
                            String? newurl2 = "";
                            String pattern = r"/([0-9]+(/[0-9]+)+)/";
                            var match = RegExp(r"/([0-9]+(/[0-9]+)+)/").hasMatch(url!);
                            print(match);
                            if(match == true){
                              postorpage = "posts";
                              ///do numbers aswell
                              ///replace where
                              String? newurl = urlnew?.replaceAll(RegExp(r"/([0-9]+(/[0-9]+)+)/"),'');
                              if(newurl !=null && newurl.contains("guides-info")){
                                newurl2 = newurl?.replaceAll(RegExp(r"(http|ftp|https)://ochd.co.uk/guides-info/"), '');

                              }
                              else {
                                newurl2 = newurl?.replaceAll(
                                    RegExp(r"(http|ftp|https)://ochd.co.uk"), '');
                              }
                              print(newurl);
                              print(newurl2);
                            }
                            else {
                              postorpage = "pages";
                              if(urlnew !=null && urlnew.contains("guides-info")) {
                                newurl2 = urlnew?.replaceAll(RegExp(
                                    r"(http|ftp|https)://ochd.co.uk/guides-info/"),
                                    '');
                              }
                              else{
                                newurl2 = urlnew?.replaceAll(RegExp(
                                    r"(http|ftp|https)://ochd.co.uk/"),
                                    '');
                              }
                              print(newurl2);
                            }
                            print(postorpage);
                            if (url!.contains("discord")) {
                              await launch(url);
                            }
                            else if (url!.contains("youtube")) {
                              await launch(url);
                            }
                            else if (url!.contains("twitter")) {
                              await launch(url);
                            }
                            else if (url!.contains("game8")) {
                              await launch(url);
                            }
                            else {
                              Widget clicked = Html(
                                  data:
                                  url
                              );
                              var client = http.Client();
                              http.Response response = await client.get(
                                  Uri.parse(url!));

                              // Use html parser
                              var document = parse(response.body);

                              print(document);
                              //List<dom.Element> urlnew = document.querySelectorAll('a[href="https://ochd.co.uk/wp-json/wp/v2/pages/"]');
                             // List<String?> urlnew = document.querySelector("link.alternate")?.attributes['href'] as List<String?>;
                              List urlnewnew = document.querySelectorAll('link[rel=alternate]');
                             // String? urlnew = urlnewnew.querySelector("link.alternate")?.attributes['href']
                              print(urlnewnew);
                              List linkMapnew = [];
                              List<Linkpulledin> linkMapnew2 = [];

                              // linkMapnew.entries.forEach((e) => list.add(Customer(e.key, e.value)));
                              String passvalue = "";


                                  for (var link in urlnewnew) {
                                    linkMapnew.add({
                                      "href": link.attributes['href'],
                                    });

                                  }
                              for (Map chars in linkMapnew) {
                                linkMapnew2.add(Linkpulledin.fromJson(chars));
                                // todoBox.add(_userDetails);

                              }
                              print(linkMapnew2[0].href);
                              for (var i in linkMapnew2){
                                if(i.href.contains("https://ochd.co.uk/wp-json/wp/v2/")){
                                  passvalue = i.href;

                                }
                              }

                                  print(passvalue);
                                  print("hrhrhrh");

                              print(urlnewnew);

                              print(linkMapnew);

                              print(passvalue);
                              print(postorpage);
                              print(newurl2);
                              var newurl3 = newurl2!.substring(0, newurl2!.length -1);
                              newurl3 = newurl3.replaceAll(RegExp('-'), ' ');
                              Navigator.push(this.context, MaterialPageRoute(
                                  builder: (context) => clickedlink(newurl2!,postorpage,newurl3)));
                              //open URL in webview, or launch URL in browser, or any other logic here
                            }
                          }

                      );


                      //  var imageurl = wppost["content"]["rendered"];



                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:<Widget>[
                                html,


                              ],

                            ),
                      );
                    });

              }
              return Expanded(
               // height: MediaQuery.of(context).size.height / 1.3,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );

            },
          ),


        ],
      ),
      bottomNavigationBar:
      Container(
        width: _bannerAd.size.width.toDouble(),
        height: _bannerAd.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd),
      ),


    );
  }
}