import 'dart:collection';
import 'dart:developer';
import 'dart:io' as io;

import 'dart:ui';


//import 'package:firebase_admob/firebase_admob.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:ochdappupdated/Detailpage.dart';
import 'package:ochdappupdated/LogProvider.dart';
import 'package:ochdappupdated/YourBottomSheetWidget.dart';
import 'package:ochdappupdated/models/JumputiChars.dart';

import 'package:ochdappupdated/models/Titleseries.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
//import 'Boxes.dart';

import 'package:filter_list/filter_list.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get_storage/get_storage.dart';


//import 'package:queries/collections.dart';
//import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:theme_mode_handler/theme_mode_handler.dart';

import 'CustomAppBar.dart';
import 'Database.dart';
import 'ad_helper.dart';
import 'main.dart';



//import 'package:quiver/core.dart';
const String testDevice = '57C2CACFF8F479D278387037AE2CC221';

class Chartab extends StatefulWidget {






  _ChartabState createState() => _ChartabState();
}
final box = GetStorage().read("chars"); // list of maps gets stored here
final boxlight = GetStorage().read("theme"); // list of maps gets stored here
List<JumputiChars> _userDetails = [];
List<JumputiChars> _searchResult = [];
List<Titleseries> _fieldList = [];
final cart = LogProvider();



List<JumputiChars> _tmp = [];
String fileurl = "https://ochd.co.uk/db/puti/Assets/Badge/";
List searchresultNEW = [];
List<JumputiChars>? selectedUserList = [];
late final JumputiChars here;
late final Titleseries TITLESERIS;
var _forceRedraw; // generate the key from this

List<String> selectedChoicesSeries = [];
List<String> selectedChoicesType = [];
List<String> selectedChoicesEra = [];
List<String> selectedChoicesClass = [];
List<String> selectedChoicesGrade = [];
int change = 1;


List _type = ["Blue","Green","Yellow","Red"];
List _era = ["1970","1980","1990","2000","2010"];
List _class = ["DPS","Balanced","Healer","Tank","Special"];

List _grade = ["Event","Hero","Limited","Musou"];
List _selectedseries = [];
List _selectedera = [];
List _selectedclass = [];
List _selectedgrade = [];
List _selectedtype = [];
class _ChartabState extends State<Chartab> with TickerProviderStateMixin {
  @override bool get wantKeepAlive => true;
  late bool _isSelected;
  late int _choiceIndex;
  static const _pageSize = 20;
  ScrollController _scrollController = ScrollController();
  TextEditingController controller = TextEditingController();

  String _selectedText = "";
  String _selectedText2 = "";
  String _selectedText3 = "";
  int selectedIndex = 0;
  late String _selectedField;
  late String _selectedField2;
  String _Tmp = "";
  late String newValueType;
  late String newValueclass;
  late String newValuechar;
  late String newValueEra;
  late Image _backgroundImage;
  late String lengthvalue;
  late ByteData bytes;
   List<JumputiChars> mylist =[];
  String message = "Press the download button to start the download";
  bool downloaded = false;
  String pathurl = "";
  List someimages = [];
  int _currentmax = 10;
  int checkifused = 0;
  // COMPLETE: Add _bannerAd
  late BannerAd _bannerAd;
  // COMPLETE: Add _isBannerAdReady
  bool _isBannerAdReady = false;
  bool isSwitched = Database().responsedarkorlight()?? false;

  myLoadAsset(String path, String id)  {
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
            "https://ochd.co.uk/db/puti/Assets/Badge/" + id + ".png");
    }


  }
  Future<void> restoreTasks() async {
    dynamic storageList = "";

    storageList = Database().responseread();
    if(storageList != null) {
      for (Map e in storageList) {
        _userDetails.add(JumputiChars.fromJson(e));
        print("map working");
      }
     // mylist = List.generate(10, (index) => _userDetails[index]);

    }


     else {
      print("storage empty");
    }
    // initializing list from storage
    //// String name, maxrarity, series,portrait,type,classs,era,method,ID;

    print("storage length 2");
  //  print(storageList.length);


  }
  Future _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('assets/Badge/'))
        .where((String key) => key.contains('.png'))
        .toList();

    setState(() {
      someimages = imagePaths;

    });
  }
  @override
  void initState() {
    // myBanner.load();
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
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
    restoreTasks();
    getUserDetails();
   // _downloadAndSavePhoto();
    _initImages();
    // _scrollController.addListener(() {
    //   if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
    //     _getmoredata();
    //
    //   }
    // });


    super.initState();
  }
  // _getmoredata(){
  //   for (int i = _currentmax; i<_currentmax+10; i++){
  //     mylist.add(_userDetails[i +1]);
  //     print(mylist);
  //     print(mylist.length);
  //     print("adding 1-");
  //   }
  //   _currentmax = _currentmax + 10;
  //   setState(() {
  //
  //   });
  // }
  @override
  void dispose() {
    _bannerAd.dispose();

    super.dispose();
  }

  /// future to this url https://ochd.co.uk/db/puti/Assets/Badge/ "last "
  Future<String?> getUserDetails() async{

    final responselength = await http.get(
        Uri.parse("https://ochd.co.uk/api/getlength.php"));
    print(responselength);
    final responseJsonlength = json.decode(responselength.body);
    print(responseJsonlength);
    print("running the get again");
    lengthvalue = responseJsonlength.toString();
    String newval = lengthvalue.substring(1,5);
    int newvalint = int.parse(newval);

    if(_userDetails.length == newvalint){

      print("truw");
      print(_userDetails.length);

    }
    else{
      print("false");
     // storageList.clear();
      _userDetails.clear();
      final response = await http.get(
          Uri.parse("https://ochd.co.uk/api/get.php"));
      final responseJson = json.decode(response.body);
      ///this is interfering with the if in the field
      var fieldListData = responseJson.map<Titleseries>((json) {
        // ignore: missing_return
        return Titleseries.fromJsonnew(json);
      }).toSet().toList();
      //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      //   List<String> personsEncoded = JumputiChars.map((person) => jsonEncode(person.toJson())).toList();
      // await sharedPreferences.setStringList('accounts', accounts);
      setState(() {

        for (Map chars in responseJson) {
          _userDetails.add(JumputiChars.fromJson(chars));


        }
      //  mylist = List.generate(10, (index) => _userDetails[index]);
        Database().clear();
        Database().responsejson(responseJson);

        //  Get.find<Database>().storePriceModel(_userDetails);
        Database().storePriceModel(_userDetails);
       // box.write('chars',_userDetails);
        print(jsonEncode(_userDetails[500]));

        checkifused = 1;

        print(_userDetails.length);





        _fieldList = fieldListData.toSet().toList();
      }


      );


    }
    

}

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: CustomAppBar("Character Database"),
        floatingActionButton:FloatingActionButton(
            heroTag: 'uniqueTag',

            onPressed: () => _showReportDialog(),
            child: const Icon(Icons.search),

        ),

      body: Column(
        children: <Widget>[
          selectedUserList == null || selectedUserList!.length == 0
              ? Expanded(
              child: _searchResult.isNotEmpty || controller.text.isNotEmpty
                  ? GroupedListView<JumputiChars, String>(
                elements: _searchResult,
                groupBy: (JumputiChars j) => j.series,
                order: GroupedListOrder.ASC,
                floatingHeader: true,

                //useStickyGroupSeparators: true,
                groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Center(
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
                itemBuilder: (context, u) {

                  return Card(
                    color: u.method =="Limited Gacha" ? Colors.yellow: null,
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      title: Text(u.name),
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                        myLoadAsset("assets/Badge/"+ u.ID + ".png",u.ID) ),
                      subtitle: Text(u.classs),
                      trailing: Image.asset(
                        "assets/images/"+
                            u.type! + ".png",),

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => DetailPage(u.ID,u.Transform,u.portrait,u.name,u.maxrarity,u.series,u.type,u.classs,u.era,u.method)));
                      },


                    ),
                    //  margin:
                    // const EdgeInsets.all(0.0),
                  );
                },
              )
                      : GroupedListView<JumputiChars, String>(
                          elements: _userDetails,
                          groupBy: (JumputiChars j) => j.series,
                          order: GroupedListOrder.ASC,
                          floatingHeader: true,

                          //useStickyGroupSeparators: true,
                          groupSeparatorBuilder: (String value) => Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Center(
                                child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                          ),
                   controller: _scrollController,

                itemBuilder: (context, i) {
                            if (i == _userDetails.length){
                              return CircularProgressIndicator();
                            }
                            return Card(
                              color: i.method == 'Limited Gacha'
                                  ? Colors.yellow
                                  : null,

                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: myLoadAsset(
                                        "assets/Badge/" + i.ID + ".png", i.ID)),
                                title: Text(i.name),
                                subtitle: Text(i.classs),
                                trailing: Image.asset(
                                  "assets/images/" + i.type! + ".png",
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailPage(i.ID,i.Transform,i.portrait,i.name,i.maxrarity,i.series,i.type,i.classs,i.era,i.method)));

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
                  color: selectedUserList![index].method =="Limited Gacha" ? Colors.yellow : null,
                  child: ListTile(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                      myLoadAsset("assets/Badge/"+ selectedUserList![index].ID + ".png",selectedUserList![index].ID)),

                    title: Text(selectedUserList![index].name),
                    subtitle: Text(selectedUserList![index].classs),
                    trailing: Image.asset(
                      "assets/images/"+
                          selectedUserList![index].type! + ".png",),

                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => DetailPage(selectedUserList![index].ID,selectedUserList![index].Transform,selectedUserList![index].portrait,selectedUserList![index].name,selectedUserList![index].maxrarity,selectedUserList![index].series,selectedUserList![index].type,selectedUserList![index].classs,selectedUserList![index].era,selectedUserList![index].method )));
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

                    content: YourBottomSheetWidget(

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
                            children:  <Widget> [
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
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
                                    _selectedtype.clear();
                                    _selectedtype.clear();
                                    _selectedseries.clear();
                                    _selectedera.clear();
                                    _selectedclass.clear();
                                    _selectedgrade.clear();
                                    print(selectedChoicesEra);
                                    print(_selectedtype);
                                    print(selectedChoicesType);


                                  });
                                  _resetfilter();

                                },



                                child: const Text('Reset', textAlign: TextAlign.center,),
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
                                child: const Text('Search',textAlign: TextAlign.center),
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
                                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                      ),
                    ],
                  );
                }
              );
            }
          );

  }
  _resetfilter(){
    setState(() {


      _searchResult.clear();
      selectedChoicesGrade.clear();
      selectedChoicesClass.clear();
      selectedChoicesEra.clear();
      selectedChoicesSeries.clear();
      selectedChoicesType.clear();
      _selectedtype.clear();
      _selectedtype.clear();
      _selectedseries.clear();
      _selectedera.clear();
      _selectedclass.clear();
      _selectedgrade.clear();
      controller.clear();
      print(selectedChoicesEra);
      print(_selectedtype);
      print(selectedChoicesType);
    });
  }
  _multiFilterRankChipState() {


      setState(() {
        _searchResult.clear();
        print("filteed length original");

        //    List _selectedtype = cart.getTypeList();
        if( Database().responsereadType() != null) {
          _selectedtype = Database().responsereadType();
          print("type not empty");
        }
        if( Database().responsereadEra() != null) {
          _selectedera = Database().responsereadEra();
          print("era not empty");
          print(_selectedclass);


        }
        if( Database().responsereadClass() != null) {
          _selectedclass = Database().responsereadClass();
          print("class not empty");
          print(_selectedclass);

        }
        if( Database().responsereadGrade() != null) {
          _selectedgrade = Database().responsereadGrade();
          print("grade not empty");
          print(_selectedgrade);


        }
        print("selected type above");
        print(_selectedtype);

        print(_selectedera);

        print(_selectedgrade);

        print(_selectedclass);


        int casetype = 0;

        if (_selectedseries.isNotEmpty & _selectedtype.isNotEmpty){
          casetype = 1;
        }

        if (_selectedseries.isNotEmpty & _selectedtype.isEmpty){
          casetype = 2;
        }
        if (_selectedtype.isNotEmpty & _selectedseries.isEmpty) {
          casetype = 3;
        }
        print("filtered below");
        List<JumputiChars> filteredList = List.from(_userDetails);
        if (_selectedclass.isNotEmpty) {
          // remove every element that does not satisfy the condition
          filteredList.removeWhere((element) => !_selectedclass.contains(element.classs));
          print(_selectedclass);
          print("filtered cladd;");
          print(filteredList.length);
          Database().clearClass();

        }
        if (_selectedtype.isNotEmpty) {
          filteredList.removeWhere((element) => !_selectedtype.contains(element.type));
          print(_selectedtype);
          print("filtered type;");
          print(filteredList.length);
          Database().clearType();
        }


        if (_selectedera.isNotEmpty) {
          filteredList.removeWhere((element) => !_selectedera.contains(element.era));
          print(_selectedera);
          print("filtered era;");
          print(filteredList.length);
          Database().clearEra();
        }
        if (_selectedgrade.isNotEmpty) {
          filteredList.removeWhere((element) => !_selectedgrade.contains(element.grade));
          print(_selectedgrade);
          print("filtered grade;");
          print(filteredList.length);
          Database().clearGrade();
        }
        print("filtered end");
        _searchResult = filteredList;
        print(_searchResult.length);
        filteredList == _userDetails;
       // _searchResult = _userDetails.where((element) => _selectedtype.contains(element.type)).toList();
 
      });

  }
  onSearchTextChanged(String text) async {
    // _searchResultseries.clear();
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }


    for (var userDetail in _userDetails) {
      if (userDetail.name.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(userDetail);
      }
    }

    print(_searchResult.length);
    setState(() {});
  }


}
