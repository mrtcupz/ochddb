import 'dart:async';

import 'dart:io' show Directory, Platform;
import 'dart:ui';


import 'package:theme_mode_handler/theme_picker_dialog.dart';

import 'MessagingService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ochdappupdated/Database.dart';
import 'package:ochdappupdated/MainOCHDPage.dart';
import 'package:ochdappupdated/about.dart';
import 'package:ochdappupdated/chartab.dart';
import 'package:path_provider/path_provider.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

//import 'package:flutter_app/legendtab.dart';

//import 'package:flutter_app/ExampleNumber.dart';
import 'theme_mode_manager.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ochdappupdated/models/JumputiChars.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;
//import 'about.dart';
import 'LegendTAB.dart';
import 'wordpress.dart';
MessagingService _msgService = MessagingService();
Color hexToColor() {
  String code = '#d3d3d3';
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
const String testDevice = '57C2CACFF8F479D278387037AE2CC221';
const int maxFailedLoadAttempts = 3;
late Box box;
class PushNotification {
  PushNotification({
    this.title,
    this.body,
  });
  String? title;
  String? body;
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  // await Hive.initFlutter(document.path);
  await Get.put(Database()).initStorage();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await _msgService.init();

  // Hive.registerAdapter(JumputiCharsAdapter());
  // await Hive.openBox<JumputiChars>('bigTEST');
  MobileAds.instance.initialize();

  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  /// InheritedWidget style accessor to our State object.
  /// We can call this static method from any descendant context to find our
  /// State object and switch the themeMode field value & call for a rebuild.
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}
/// Our State object

class _MyAppState extends State<MyApp> {
  /// 1) our themeMode "state" field
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return ThemeModeHandler(
        manager: ExampleThemeModeManager(),

        builder: (ThemeMode themeMode) {
        return MaterialApp(
          theme: ThemeData( primaryColor: Colors.white,
              brightness: Brightness.light,
              primaryColorDark: Colors.black,
              canvasColor: Colors.white,
              // next line is important!
              appBarTheme: AppBarTheme(backgroundColor: Colors.white)),
          darkTheme: ThemeData( primaryColor: Colors.black,
              primaryColorLight: Colors.black,
              brightness: Brightness.dark,
              primaryColorDark: Colors.black,
              indicatorColor: Colors.white,
              canvasColor: Colors.black,
              // next line is important!
              appBarTheme: AppBarTheme(backgroundColor: Colors.black)),
          themeMode: themeMode, // 2) ← ← ← use "state" field here //////////////
          home: HomePage(),
        );
      }
    );
  }

  /// 3) Call this to change theme from any context using "of" accessor
  /// e.g.:
  /// MyApp.of(context).changeTheme(ThemeMode.dark);
  void changeTheme(ThemeMode themeMode) {
    setState(() {

      print(themeMode);
      print(themeMode.toString());

      print("theme above");

      _themeMode = themeMode;


    });
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(" --- background message received ---");
  print(message.notification!.title);
  print(message.notification!.body);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static _HomePageState? of(BuildContext context) =>
      context.findAncestorStateOfType<_HomePageState>();

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  static const AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  // late BannerAd _bannerAd;
  // InterstitialAd? _interstitialAd;
//  int _numInterstitialLoadAttempts = 0;

  late final FirebaseMessaging _messaging;
  PushNotification? _notificationInfo;

  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }

  PersistentTabController _controller = PersistentTabController(
      initialIndex: 0);


  List<Widget> containers = [
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.blue,

    ),
    Container(
      color: Colors.deepPurple,
    )
  ];

  @override
  void initState() {


    super.initState();
  }

  @override
  void dispose() {
    // myBanner.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(child: MainOCHDPage()),

        ]
    );
  }

  bottomad() {
//String here = ThemeModeHandler.of(context)?.themeMode as String;
  print("theme below inti");
  bool mode = false;

  if(ThemeModeHandler.of(context)?.themeMode == ThemeMode.light){
    mode = false;
  }
  else if(ThemeModeHandler.of(context)?.themeMode == ThemeMode.dark){
    mode = true;
  }
print(ThemeModeHandler.of(context)?.themeMode);
return  PersistentTabView(
      context,
      controller: _controller,
      screens: [
        MainOCHDPage(),
        Chartab(),
        wordpress(),

      ],
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: mode == false
          ? Colors.white
          : mode == true
          ? Colors.black:Colors.black,

      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,


  // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: mode == false
            ? Colors.white
            : mode == true
            ? Colors.black:Colors.black,
      ),
      popAllScreensOnTapOfSelectedTab: false,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle
          .style3, // Choose the nav bar style with this property.

    );

  }

  void _selectThemeMode(BuildContext context) async {
    final newThemeMode = await showThemePickerDialog(context: context);
    print(newThemeMode);
  }
  List<Widget> _buildScreens() {
    return [
      MainOCHDPage(),
      Chartab(),
      wordpress(),

    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [

      PersistentBottomNavBarItem(

        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        activeColorSecondary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        inactiveColorSecondary: CupertinoColors.destructiveRed,

       // routeAndNavigatorSettings:

      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.bag),
        title: ("Characters"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,

      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.news),
        title: ("News"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,

      ),
    ];
  }
}
  // Widget buildPages(){
  //   switch(index){
  //     case 1:
  //       return Chartab();
  //     case 2:
  //       return LegendTAB();
  //     case 0:
  //     default:
  //       return MainOCHDPage();
  //
  //
  //   }
  // }
  // Widget buildBottomNaigation() {
  //   return BottomNavyBar(
  //     backgroundColor: Colors.black,
  //     selectedIndex: index,
  //     onItemSelected: (index) => setState(() {
  //       this.index = index;
  //     }),
  //     items: <BottomNavyBarItem>[
  //       BottomNavyBarItem(
  //         icon: Icon(Icons.apps),
  //         title: Text('Home'),
  //       ),
  //       BottomNavyBarItem(
  //         icon: Icon(Icons.add_circle_rounded),
  //         title: Text('test'),
  //         textAlign: TextAlign.center,
  //         activeColor: Colors.green,
  //         inactiveColor: Colors.blue
  //       ),
  //       BottomNavyBarItem(
  //         icon: Icon(Icons.settings),
  //         title: Text('set'),
  //       ),
  //       BottomNavyBarItem(
  //         icon: Icon(Icons.headset),
  //         title: Text('head'),
  //       ),
  //     ],);
  // }



