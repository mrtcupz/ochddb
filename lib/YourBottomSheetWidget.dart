

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ochdappupdated/chartab.dart';
import 'package:ochdappupdated/models/Titleseries.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

import 'Database.dart';
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

class YourBottomSheetWidget extends StatefulWidget {
   final List<Titleseries> fieldlist;


  late final Function(List<String>)? onSelectionChanged;
  late final Function(List<String>)? onMaxSelected;

  YourBottomSheetWidget( {this.onSelectionChanged, this.onMaxSelected, required this.fieldlist,});
  @override
  _YourBottomSheetWidgetState createState() => _YourBottomSheetWidgetState(this.fieldlist);
}

class _YourBottomSheetWidgetState extends State<YourBottomSheetWidget> {
  static List<TypeModel> _typemodel = [
    TypeModel(type:"Blue"),
    TypeModel(type:"Red"),
    TypeModel(type:"Yellow"),
    TypeModel(type:"Green"),




  ];
  final List<String> _filters = <String>[];
  //late final List<Titleseries> fieldlist;

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
   var _selectedseries = "";
  List _selectedera = [];
  List _selectedclass = [];
  List _selectedgrade = [];
  List _selectedtype = [];
  bool mode = false;

  _YourBottomSheetWidgetState(var fieldlist);
  String dropdownvalue = fieldList[0].series;

  @override
  Widget build(BuildContext context) {
    //   super.build(context);
    print("transfer");
    print(fieldList[0].series);
    print(fieldList[1].series);
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
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Wrap(

                    children: <Widget>[
                      _titleContainer("Era"),
                    ],
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Wrap(

                    children: <Widget>[
                      ..._buildchoiceera(),
                    ],
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Wrap(

                    children: <Widget>[
                      _titleContainer("Class"),
                    ],
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Wrap(

                    children: <Widget>[
                      ..._buildchoiceclass(),
                    ],
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Wrap(

                    children: <Widget>[
                      _titleContainer("Grade"),
                    ],
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Wrap(

                    children: <Widget>[
                      ..._buildchoicegrade(),
                    ],
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Wrap(

                    children: <Widget>[
                      _titleContainer("Series"),
                    ],
                  )),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Wrap(
                    children: [
                      DropdownButton<String>(
                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: fieldList.map((items) {
                          return DropdownMenuItem(
                            value: items.series,
                            child: new SizedBox(width: 200.0, child: new Text(items.series)),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            _selectedseries = dropdownvalue;
                            Database().responseSeries(_selectedseries);
                            print(_selectedseries.toString());
                            selectedChoicesSeries.contains(newValue)
                                ? selectedChoicesSeries.remove(newValue)
                                : selectedChoicesSeries.add(newValue);
                            widget.onSelectionChanged?.call(selectedChoicesSeries);
                          });
                        },
                        //   // After selecting the desired option,it will
                        //   // change button value to selected value
                        //
                      ),
                    ],
                  )),

            ])

    );
  }

  _buildchoicetype() {
    List<Widget> choices = [];
    bool mode = false;

    if(ThemeModeHandler.of(context)?.themeMode == ThemeMode.light){
      mode = false;
    }
    else if(ThemeModeHandler.of(context)?.themeMode == ThemeMode.dark){
      mode = true;
    }
    for (var item in _type) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: FilterChip(
          label: Text(item, style: TextStyle(
            color: mode == false
                ? Colors.white
                : mode == true
                ? Colors.black:Colors.black,
          ),),
          selected: selectedChoicesType.contains(item),
          backgroundColor: Colors.red,
          selectedColor: Colors.blue,
          onSelected: (selected) {
            // print(item);

            {
              setState(() {

                print("cart added");


                _selectedtype = selectedChoicesType;
                Database().responseType(selectedChoicesType);
                print(_selectedtype.toString());

                selectedChoicesType.contains(item)
                    ? selectedChoicesType.remove(item)
                    : selectedChoicesType.add(item);
                widget.onSelectionChanged?.call(selectedChoicesType);

              }


              );
            }
          },
        ),
      ));
    }
    return choices;
  }

  _buildchoiceera() {
    List<Widget> choices = [];
    bool mode = false;

    if(ThemeModeHandler.of(context)?.themeMode == ThemeMode.light){
      mode = false;
    }
    else if(ThemeModeHandler.of(context)?.themeMode == ThemeMode.dark){
      mode = true;
    }
    for (var item in _era) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: FilterChip(
          label: Text(item, style: TextStyle(
            color: mode == false
                ? Colors.white
                : mode == true
                ? Colors.black:Colors.black,
          ),),
          selected: selectedChoicesEra.contains(item),
          backgroundColor: Colors.red,
          selectedColor: Colors.blue,
          onSelected: (selected) {
            // print(item);

            {
              setState(() {
                _selectedera = selectedChoicesEra;

                Database().responseEra(selectedChoicesEra);
                selectedChoicesEra.contains(item)
                    ? selectedChoicesEra.remove(item)
                    : selectedChoicesEra.add(item);
                widget.onSelectionChanged?.call(selectedChoicesEra);

              }


              );
            }
          },
        ),
      ));
    }
    return choices;
  }

  _buildchoiceclass() {
    List<Widget> choices = [];
    bool mode = false;

    if(ThemeModeHandler.of(context)?.themeMode == ThemeMode.light){
      mode = false;
    }
    else if(ThemeModeHandler.of(context)?.themeMode == ThemeMode.dark){
      mode = true;
    }
    for (var item in _class) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: FilterChip(
          label: Text(item, style: TextStyle(
            color: mode == false
                ? Colors.white
                : mode == true
                ? Colors.black:Colors.black,
          ),),
          selected: selectedChoicesClass.contains(item),
          backgroundColor: Colors.red,
          selectedColor: Colors.blue,
          onSelected: (selected) {
            // print(item);

            {
              setState(() {
                _selectedclass = selectedChoicesClass;
                Database().responseClass(selectedChoicesClass);
                selectedChoicesClass.contains(item)
                    ? selectedChoicesClass.remove(item)
                    : selectedChoicesClass.add(item);
                widget.onSelectionChanged?.call(selectedChoicesClass);


              }


              );
            }
          },
        ),
      ));
    }
    return choices;
  }

  _buildchoicegrade() {
    List<Widget> choices = [];
    bool mode = false;

    if(ThemeModeHandler.of(context)?.themeMode == ThemeMode.light){
      mode = false;
    }
    else if(ThemeModeHandler.of(context)?.themeMode == ThemeMode.dark){
      mode = true;
    }
    for (var item in _grade) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: FilterChip(
          label: Text(item, style: TextStyle(
            color: mode == false
                ? Colors.white
                : mode == true
                ? Colors.black:Colors.black,
          ),),
          selected: selectedChoicesGrade.contains(item),
          backgroundColor: Colors.red,
          selectedColor: Colors.blue,
          onSelected: (selected) {
            // print(item);

            {
              setState(() {
                _selectedgrade = selectedChoicesGrade;
                Database().responseGrade(selectedChoicesGrade);
                selectedChoicesGrade.contains(item)
                    ? selectedChoicesGrade.remove(item)
                    : selectedChoicesGrade.add(item);
                widget.onSelectionChanged?.call(selectedChoicesGrade);



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
      selectedChoicesSeries.clear();
      selectedChoicesType.clear();
      _selectedtype.clear();
      _selectedtype.clear();
    //  _selectedseries.clear();
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
      style:  TextStyle(
          color: mode == false
              ? Colors.black
              : mode == true
              ? Colors.blue:Colors.blue, fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }


}
