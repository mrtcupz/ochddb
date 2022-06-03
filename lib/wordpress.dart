
import 'dart:io';
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:ochdappupdated/CustomAppBar.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordpress_api/wordpress_api.dart';
import 'CardClickedwordpress.dart';
import 'Database.dart';
import 'ad_helper.dart';
import 'clickedlink.dart';
import 'main.dart';
import 'wpapi.dart';
import 'package:html/dom.dart' as dom;


class wordpress extends StatefulWidget {

  _wordpressState createState() => _wordpressState();
}

class _wordpressState extends State<wordpress> {
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
    appBar: CustomAppBar("News"),




    body: Stack(
      children:<Widget>[
        FutureBuilder(
          future: fetchWpPosts(),
          builder: (context, AsyncSnapshot snapshot){

            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index){
                    Map wppost = snapshot.data[index];
                    Widget html = Html(
                      data:
                      wppost['title']['rendered'],


                    );
                    print(html.toString());
                    Widget html2 = Html(
                      data: wppost['excerpt']['rendered'],
                        onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, dom.Element? element) async {
                          print("tapped");
                          print(url);
                          var checkedurl = url;
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

                            String? value2 = document.querySelector('[name=comment_post_ID]')?.attributes['value'];

                            print("split");
                            print(value2);

                            // List<dom.Element> links = document.getElementById('#body');
                            List<dom.Element> links2 = document.querySelectorAll(
                                '[name=comment_post_ID]');

                            List<Map<String, dynamic>> linkMap = [];

                            print(links2);
                            for (var link in links2) {
                              linkMap.add({
                                'value': link.attributes['value'],
                              });
                            }
                            json.encode(linkMap);
                            print("linkmap");
                            print(linkMap);
                            print(linkMap.toString());


                          //  Navigator.push(this.context, MaterialPageRoute(
                            //    builder: (context) => clickedlink(value2!)));
                            //open URL in webview, or launch URL in browser, or any other logic here
                          }
                        }
                    );
                  //  var imageurl = wppost["content"]["rendered"];

                   return
                    Card(
                        child: InkWell(
                        onTap: () {
                          print("clicked");
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => CardClickedwordpress(wppost['id'].toString(),wppost['title']['rendered'].toString())));

                    },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                           // Image.network(imageurl),
                            Text(wppost['title']['rendered'].replaceAll("#8217;","").replaceAll("#8211;","").replaceAll("#038;","").toString(),style: TextStyle(color: Colors.blue),textAlign: TextAlign.center,textScaleFactor: 1.5,),
                            html2,
                            //Text(wppost['title']['rendered'].replaceAll("#8217;","").replaceAll("#8211;","").replaceAll("#038;","")),
                           // Text(parse((wppost['excerpt']['rendered']).toString()).documentElement!.text)

                          ],



                      ),
                        ),

                    ),



                    );


                  });

            }
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: Center(
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