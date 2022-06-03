
import 'package:flutter_html/flutter_html.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:html/dom.dart' as dom;


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ochdappupdated/CustomAppBar.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Database.dart';
import 'ad_helper.dart';
import 'main.dart';
import 'wpapi.dart';


class about extends StatefulWidget {

  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {

  // TODO: Add _bannerAd
  late BannerAd _bannerAd;

  // TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;
  bool isSwitched = Database().responsedarkorlight()?? false;
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
      appBar: CustomAppBar("About"),
      body: Stack(
        children: [
          FutureBuilder(
            future: fetchabout(),
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
                          }

                      );
                      print(html);
                      print("object");


                      //  var imageurl = wppost["content"]["rendered"];
                      return  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:<Widget>[
                                ///store this html somewhere for cache
                                html,
                                //Text(parse((wppost['content']['rendered']).toString()).documentElement!.text),
                                //   Image.network(parse((wppost['content']['rendered']).toString().getElementByTag()),


                              ],

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