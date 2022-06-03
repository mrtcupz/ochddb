import 'dart:collection';
import 'dart:io' as io;

import 'dart:ui';


//import 'package:firebase_admob/firebase_admob.dart';

import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:ochdappupdated/Database.dart';
import 'package:ochdappupdated/DetailPageLegend.dart';
import 'package:ochdappupdated/Detailpage.dart';
import 'package:ochdappupdated/chartab.dart';
import 'package:ochdappupdated/models/JumputiChars.dart';
import 'package:ochdappupdated/models/Legend.dart';
import 'package:ochdappupdated/models/Titleseries.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

import 'package:filter_list/filter_list.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';


//import 'package:queries/collections.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:theme_mode_handler/theme_mode_handler.dart';

import 'CustomAppBar.dart';
import 'ad_helper.dart';
import 'main.dart';
import 'models/CharINFOStats.dart';


//import 'package:quiver/core.dart';
import 'YourBottomSheetWidgetLegend.dart';

const String testDevice = '57C2CACFF8F479D278387037AE2CC221';

class LegendTAB extends StatefulWidget {


  _LegendTABState createState() => _LegendTABState();
}

final box = GetStorage().read("legend"); // list of maps gets stored here

List<Legend> _userDetails = [];
List<Legend> _searchResult = [];
List<Titleseries> _fieldList = [];
List _type = ["Blue", "Green", "Yellow", "Red"];
List searchresultNEW = [];
List<Legend>? selectedUserList = [];
late final Legend here;
late final Titleseries TITLESERIS;
List<String> selectedChoicesSeries = [];
List<String> selectedChoicesTypelegend = [];

List _selectedseries = [];
List _selectedera = [];
List _selectedclass = [];
List _selectedgrade = [];
List _selectedtypelegend = [];

class _LegendTABState extends State<LegendTAB> with TickerProviderStateMixin {
  @override bool get wantKeepAlive => true;

  TextEditingController controller = TextEditingController();

  int selectedIndex = 0;

  late String newValueType;
  late String newValueclass;
  late String newValuechar;
  late String newValueEra;
  int checkifused = 0;
  late String lengthvalue;


  late ByteData bytes;

  String message = "Press the download button to start the download";
  bool downloaded = false;
  String pathurl = "";
  List someimages = [];
  bool isSwitched = Database().responsedarkorlight()?? false;

  // TODO: Add _bannerAd
  late BannerAd _bannerAd;

  // TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;
  myLoadAsset(String path, String id) {
    int casetype = 0;
    if (someimages.contains(path)) {
      casetype = 1;
      print("here");
    }
    else {
      print('not here');
      casetype = 2;
    }
    // if (io.File(path).exists() == null) {
    //   print("not there");
    //   casetype = 2;
    // }
    switch (casetype) {
      case 1:
        return AssetImage(path);

      case 2:
        return NetworkImage(
            "https://ochd.co.uk/db/puti/Assets/Legend/ico/" + id.substring(2) +
                ".png");
    }
  }

  Future<void> restoreTasks() async {
    dynamic storageList = "";

    storageList = Database().responsereadlegend();
    if (storageList != null) {
      for (Map e in storageList) {
        _userDetails.add(Legend.fromJson(e));
        print("map working");
      }
      // mylist = List.generate(10, (index) => _userDetails[index]);

    }
  }

  Future _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('assets/Legend/ico/'))
        .where((String key) => key.contains('.png'))
        .toList();

    setState(() {
      someimages = imagePaths;
      print(someimages);
      print("here images");
    });
  }

  @override
  void initState() {
    restoreTasks();

    getUserDetails();
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
    // _downloadAndSavePhoto();
    _initImages();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  /// future to this url https://ochd.co.uk/db/puti/Assets/Badge/ "last "
  Future<String?> getUserDetails() async {
    final responselength = await http.get(
        Uri.parse("https://ochd.co.uk/api/getlengthlegend.php"));
    final responseJsonlength = json.decode(responselength.body);
    print("running the get again");
    lengthvalue = responseJsonlength.toString();
    String newval = lengthvalue.substring(1, 2);
    int newvalint = int.parse(newval);

    if (_userDetails.length == newvalint) {
      print("truw");
      print(_userDetails.length);
    }
    else {
      _userDetails.clear();
      final response = await http.get(
          Uri.parse("https://ochd.co.uk/api/getlegend.php"));
      final responseJson = json.decode(response.body.toString());

      ///this is interfering with the if in the field

      //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      //   List<String> personsEncoded = JumputiChars.map((person) => jsonEncode(person.toJson())).toList();
      // await sharedPreferences.setStringList('accounts', accounts);
      setState(() {
        for (Map chars in responseJson) {
          _userDetails.add(Legend.fromJson(chars));
          // todoBox.add(_userDetails);

        }
        Database().clear();
        Database().responsejsonlegend(responseJson);

        //  Get.find<Database>().storePriceModel(_userDetails);
        Database().storePriceModellegend(_userDetails);
        // box.write('chars',_userDetails);
        print(jsonEncode(_userDetails[3]));

        checkifused = 1;

        print(_userDetails.length);
      }


      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Legend Database"),



        floatingActionButton: FloatingActionButton(
          heroTag: 'uniqueTag',
          onPressed: () => _showReportDialog(),
          child: const Icon(Icons.search),
        ),

        body: Column(
            children: <Widget>[
              selectedUserList == null || selectedUserList!.length == 0
                  ? Expanded(
                  child: _searchResult.isNotEmpty || controller.text.isNotEmpty
                      ? GroupedListView<Legend, String>(
                    elements: _searchResult,
                    groupBy: (Legend j) => j.Series,
                    order: GroupedListOrder.ASC,
                    floatingHeader: true,

                    //useStickyGroupSeparators: true,
                    groupSeparatorBuilder: (String value) =>
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Center(
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                        ),
                    itemBuilder: (context, u) {
                      return Card(
                        child: ListTile(
                          contentPadding:
                          const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          title: Text(u.Name),
                          leading: CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                              myLoadAsset("assets/Legend/ico/" + u.ID.substring(
                                  2) + ".png", u.ID)),
                          subtitle: Text(u.Rarity),
                          trailing: Image.asset(
                            "assets/images/" +
                                u.Type! + ".png",),

                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) => DetailPageLegend(
                                u.ID, u.Type, u.Series, u.Name, u.Rarity)));
                          },

                        ),
                        //  margin:
                        // const EdgeInsets.all(0.0),
                      );
                    },
                  )

                      : GroupedListView<Legend, String>(
                    elements: _userDetails,
                    groupBy: (Legend j) => j.Series,
                    order: GroupedListOrder.ASC,
                    floatingHeader: true,

                    //useStickyGroupSeparators: true,
                    groupSeparatorBuilder: (String value) =>
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Center(
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                        ),
                    itemBuilder: (context, i) {
                      return Card(


                        child: ListTile(
                          contentPadding:
                          const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                              myLoadAsset("assets/Legend/ico/" + i.ID.substring(
                                  2) + ".png", i.ID)),
                          title: Text(i.Name),
                          subtitle: Text(i.Rarity),
                          trailing: Image.asset(
                            "assets/images/" +
                                i.Type + ".png",),

                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) => DetailPageLegend(
                                i.ID, i.Type, i.Series, i.Name, i.Rarity)));
                          },
                        ),
                        // margin: const EdgeInsets.all(0.0),
                      );
                    },
                  ))
                  : Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        contentPadding:
                        const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                            myLoadAsset(
                                "assets/Legend/ico/" + selectedUserList![index]
                                    .ID.substring(2) + ".png",
                                selectedUserList![index].ID)),

                        title: Text(selectedUserList![index].Name),
                        //  subtitle: Text(selectedUserList![index].HowToObtain),
                        trailing: Image.asset(
                          "assets/images/" +
                              selectedUserList![index].Type! + ".png",),

                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => DetailPageLegend(
                              selectedUserList![index].ID,
                              selectedUserList![index].Type,
                              selectedUserList![index].Series,
                              selectedUserList![index].Name,
                              selectedUserList![index].Rarity)));
                        },

                      ),
                      //  margin:
                      // const EdgeInsets.all(0.0),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: selectedUserList!.length,
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
  }

  List<String> selectedReportList = [];

  _showReportDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog

          return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(

                  content: YourBottomSheetWidgetLegend(

                    // //_fieldList,
                    onSelectionChanged: (selectedList) {
                      _multiFilterRankChipState();
                    },
                  ),

                  actions: <Widget>[
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<
                                    Color>(Colors.red),
                                //backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                              ),
                              onPressed: () {
                                setState(() {
                                  _searchResult.clear();
                                  selectedChoicesGrade.clear();
                                  selectedChoicesClass.clear();
                                  selectedChoicesEra.clear();
                                  selectedChoicesSeries.clear();
                                  selectedChoicesType.clear();
                                  _selectedtypelegend.clear();

                                  _selectedseries.clear();
                                  _selectedera.clear();
                                  _selectedclass.clear();
                                  _selectedgrade.clear();
                                  print(selectedChoicesEra);

                                  print(selectedChoicesType);
                                });
                                _resetfilter();
                              },


                              child: const Text(
                                'Reset', textAlign: TextAlign.center,),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                              ),
                              onPressed: () {
                                print("pop");
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                  'Search', textAlign: TextAlign.center),
                            ),
                          ],
                        )),
                    TextField(
                      onChanged: (value) {
                        onSearchTextChanged(value);
                      },
                      controller: controller,
                      decoration: const InputDecoration(
                          labelText: "Search",
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(25.0)))),
                    ),
                  ],
                );
              }
          );
        }
    );
  }

  _resetfilter() {
    setState(() {
      _searchResult.clear();
      selectedChoicesGrade.clear();
      selectedChoicesClass.clear();
      selectedChoicesEra.clear();
      selectedChoicesSeries.clear();
      selectedChoicesType.clear();
     _selectedtypelegend.clear();

      _selectedseries.clear();
      _selectedera.clear();
      _selectedclass.clear();
      _selectedgrade.clear();
      controller.clear();
      print(selectedChoicesEra);

      print(selectedChoicesType);
    });
  }

  _multiFilterRankChipState() {
    setState(() {
      _searchResult.clear();
      print("filteed length original");

      //    List _selectedtype = cart.getTypeList();
      if (Database().responsereadTypelegend() != null) {
        _selectedtypelegend = Database().responsereadTypelegend();
        print("type not empty");
      }

      print("selected type above");


      print(_selectedera);

      print(_selectedgrade);

      print(_selectedclass);




      print("filtered below");
      List<Legend> filteredList = List.from(_userDetails);

      if (_selectedtypelegend.isNotEmpty) {
        filteredList.removeWhere((element) =>
        !_selectedtypelegend.contains(element.Type));

        print("filtered type;");
        print(filteredList.length);
        Database().clearTypelegend();
      }

      print("filtered end");
      _searchResult = filteredList;
      print(_searchResult.length);
      filteredList == _userDetails;
      // _searchResult = _userDetails.where((element) => _selectedtype.contains(element.type)).toList();

    });
  }

  Widget _titleContainer(String myTitle) {
    return Text(
      myTitle,
      style: const TextStyle(
          color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }

  onSearchTextChanged(String text) async {
    // _searchResultseries.clear();
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }


    for (var userDetail in _userDetails) {
      if (userDetail.Name.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(userDetail);
      }
    }

    print(_searchResult.length);
    setState(() {});
  }
}





