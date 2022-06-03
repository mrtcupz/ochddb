import 'dart:convert';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:html/dom.dart' as dom;
import 'package:flutter_html/flutter_html.dart';

import 'package:html/parser.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ochdappupdated/ad_helper.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:wordpress_api/wordpress_api.dart';
import 'Database.dart';
import 'main.dart';
import 'wpapi.dart';

import 'wpapi.dart';
class clickedlink extends StatefulWidget {
  final String url;
  final String postorpage;
  final String htmlurl;
  clickedlink(this.url, this.postorpage, this.htmlurl);
  _clickedlinkState createState() => _clickedlinkState(url,postorpage,htmlurl);
}

class _clickedlinkState extends State<clickedlink> {
  final String url;
  final String postorpage;
  final String htmlurl;

  _clickedlinkState(this.url, this.postorpage,this.htmlurl);
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
      appBar: AppBar(

        leading: BackButton(color: Colors.blue),

        title: Text(htmlurl[0].toUpperCase() + htmlurl.substring(1),style: TextStyle(color: Colors.blue))),
      body: Stack(
        children: [
          FutureBuilder(
            future: fetchurl(url, postorpage),

            builder: (context, AsyncSnapshot snapshot){

              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index){
                      Map wppost = snapshot.data[index];
                      Widget html = Html(
                        data:
                        wppost['content']['rendered'],


                      );
                      print(html);
                      print(url);


                      //  var imageurl = wppost["content"]["rendered"];
                      return  InkWell(
                          onTap: () {
                            print("tapped");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:<Widget>[
                                html,
                                //Text(parse((wppost['content']['rendered']).toString()).documentElement!.text),
                                //   Image.network(parse((wppost['content']['rendered']).toString().getElementByTag()),

                              ],
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
    if (_isBannerAdReady)
    Align(
    alignment: Alignment.bottomCenter,
    child: Container(
    width: _bannerAd.size.width.toDouble(),
    height: _bannerAd.size.height.toDouble(),
    child: AdWidget(ad: _bannerAd),
    ),
    )
        ],
      ),
    );
  }
}