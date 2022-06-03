

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ochdappupdated/LegendTAB.dart';
import 'package:ochdappupdated/chartab.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'CustomAppBar.dart';
import 'Database.dart';
import 'ad_helper.dart';
import 'main.dart' as main;
import 'package:ochdappupdated/wordpress.dart';
import 'about.dart';
import 'guides.dart';
import 'main.dart';
import 'wordpress.dart' as wordpress;

import 'wordpress.dart';
final List _items = [

  ("assets/MainPage/aboutbutton.png"),
  ("assets/MainPage/characterdbbutton.png"),
  ("assets/MainPage/guidesbutton.png"),
  ("assets/MainPage/legend.png"),
  ("assets/MainPage/news-buttoin-1.png"),



];

List postlist = [];
bool isSwitched = Database().responsedarkorlight()?? false;


class MainOCHDPage extends StatefulWidget {

  bool isSwitched = Database().responsedarkorlight()?? false;


_MainOCHDPagestate createState() => _MainOCHDPagestate();
}

class  _MainOCHDPagestate extends State<MainOCHDPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;
  // TODO: Add _bannerAd
  late BannerAd _bannerAd;
  late String appBarText;

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

  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar:
      AppBar(
          centerTitle: true,
          title: Text(
              "Home",style: TextStyle(color: Colors.blue)
          ),

           actions: [

        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              print('value before switch');
              print(Database().responsedarkorlight());
              isSwitched = value;
              print("value here");
              print(value);
              if (isSwitched == true) {
                MyApp.of(context)?.changeTheme(ThemeMode.dark);
                ThemeModeHandler.of(context)?.saveThemeMode(ThemeMode.dark);
                print(ThemeModeHandler
                    .of(context)
                    ?.themeMode);
                Database().darkorlight(value);
                print("database below");
                print(Database().responsedarkorlight());
              }
              else {
                MyApp.of(context)?.changeTheme(ThemeMode.light);
                ThemeModeHandler.of(context)?.saveThemeMode(ThemeMode.light);
                print("database below");

                Database().darkorlight(value);
                print(Database().responsedarkorlight());
              }
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.green,
        ),
      ]
      ),

      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => wordpress.wordpress()),
                          );
                        },
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/MainPage/news-buttoin-1.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    )],
                ),

              ),
              Expanded(

                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Chartab()
                      ));
                    },
                        child: Image.asset(
                          'assets/MainPage/characterdbbutton.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                  ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LegendTAB()),
                            );
                          },
                        child: Image.asset(
                          'assets/MainPage/legend.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => guides()),
                            );
                          },
                        child: Image.asset(
                          'assets/MainPage/guidesbutton.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                         ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => about()),
                            );
                          },
                        child: Image.asset(
                          'assets/MainPage/aboutbutton.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      )],
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
  Widget buildPages(){
    switch(index){
      case 1:
        return Chartab();
      case 2:
        return LegendTAB();
      case 0:
      default:
        return MainOCHDPage();


    }
  }

}