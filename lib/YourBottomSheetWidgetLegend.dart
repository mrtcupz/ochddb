

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ochdappupdated/chartab.dart';
import 'package:ochdappupdated/models/Titleseries.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';
import 'Database.dart';
import 'LegendTAB.dart';
import 'LogProvider.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class TypeModel {
  final String type;


  TypeModel(
      {
        required this.type,
      }
      );
}

class YourBottomSheetWidgetLegend extends StatefulWidget {
  // final List<Titleseries> _fieldlist;


  late final Function(List<String>)? onSelectionChanged;
  late final Function(List<String>)? onMaxSelected;
  YourBottomSheetWidgetLegend( {this.onSelectionChanged, this.onMaxSelected});
  @override
  _YourBottomSheetWidgetLegendState createState() => _YourBottomSheetWidgetLegendState();
}

class _YourBottomSheetWidgetLegendState extends State<YourBottomSheetWidgetLegend> {
  static List<TypeModel> _typemodel = [
    TypeModel(type:"Blue"),
    TypeModel(type:"Red"),
    TypeModel(type:"Yellow"),
    TypeModel(type:"Green"),




  ];
  final List<String> _filters = <String>[];
  final _items = _typemodel
      .map((type) => MultiSelectItem<TypeModel>(type, type.type))
      .toList();
  // @override bool get wantKeepAlive => true;
  final List _grade = ["Event","Hero","Limited","Musou"];
  List _selectedAnimals2 = [];

  final List _type = ["Blue","Green","Yellow","Red"];
  final List _era = ["1970","1980","1990","2000","2010"];
  final List _class = ["DPS","Balanced","Healer","Tank","Special"];
  // final cart = LogProvider();
  List _selectedseries = [];
  List _selectedera = [];
  List _selectedclass = [];
  List _selectedgrade = [];
  List _selectedtype = [];
  bool mode = false;

  @override
  Widget build(BuildContext context) {
    //   super.build(context);

    return SingleChildScrollView(

        child:


        Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[

              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Wrap(

                    children: <Widget>[
                      _titleContainer("Type"),
                    ],
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Wrap(

                    children: <Widget>[
                      ..._buildchoicetype(),
                    ],
                  )),


            ])

    );
  }

  _buildchoicetype() {
    List<Widget> choices = [];

    for (var item in _type) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: FilterChip(
          label: Text(item),
          selected: selectedChoicesTypelegend.contains(item),
          backgroundColor: Colors.red,
          selectedColor: Colors.blue,
          onSelected: (selected) {
            // print(item);

            {
              setState(() {

                print("cart added");



                Database().responseTypeLegend(selectedChoicesTypelegend);
                print(_selectedtype.toString());

                selectedChoicesTypelegend.contains(item)
                    ? selectedChoicesTypelegend.remove(item)
                    : selectedChoicesTypelegend.add(item);
                widget.onSelectionChanged?.call(selectedChoicesTypelegend);
              }


              );
            }
          },
        ),
      ));
    }
    return choices;
  }




  void _update() {
    setState(() {



      selectedChoicesGrade.clear();
      selectedChoicesClass.clear();
      selectedChoicesEra.clear();
      selectedChoicesType.clear();
      _selectedtype.clear();
      _selectedtype.clear();
      _selectedseries.clear();
      _selectedera.clear();
      _selectedclass.clear();
      _selectedgrade.clear();
    });
  }
  Widget _titleContainer(String myTitle) {
    if(ThemeModeHandler.of(context)?.themeMode == ThemeMode.light){
      mode = false;
    }
    else if(ThemeModeHandler.of(context)?.themeMode == ThemeMode.dark){
      mode = true;
    }
    return Text(
      myTitle,
      style: TextStyle(
          color: mode == false
              ? Colors.black
              : mode == true
              ? Colors.blue:Colors.blue, fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }


}