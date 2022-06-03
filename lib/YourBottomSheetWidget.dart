

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ochdappupdated/chartab.dart';
import 'package:ochdappupdated/models/Titleseries.dart';
import 'package:provider/provider.dart';
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
  // final List<Titleseries> _fieldlist;


  late final Function(List<String>)? onSelectionChanged;
  late final Function(List<String>)? onMaxSelected;
  YourBottomSheetWidget( {this.onSelectionChanged, this.onMaxSelected});
  @override
  _YourBottomSheetWidgetState createState() => _YourBottomSheetWidgetState();
}

class _YourBottomSheetWidgetState extends State<YourBottomSheetWidget> {
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

  @override
  Widget build(BuildContext context) {
    //   super.build(context);

    return SingleChildScrollView(

        child:


        Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[

    //           Padding(
    //           padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
    //           child: Wrap(
    //             children: <Widget>[
    //               MultiSelectDialogField(
    //                 items: _items,
    //                 title: const Text("Type"),
    //                 selectedColor: Colors.blue,
    //                 decoration: BoxDecoration(
    //                   color: Colors.blue.withOpacity(0.1),
    //                   borderRadius: BorderRadius.all(Radius.circular(40)),
    //                   border: Border.all(
    //                     color: Colors.blue,
    //                     width: 2,
    //                   ),
    //                 ),
    //
    //                 buttonText: Text(
    //                   "Type",
    //                   style: TextStyle(
    //                     color: Colors.blue[800],
    //                     fontSize: 16,
    //                   ),
    //                 ),
    //                 onConfirm: (results) {
    //                   _selectedAnimals2 = results;
    //                   print(_selectedAnimals2);
    //                   setState(() {
    //
    //                   print("cart added");
    //
    //                   _selectedtype = selectedChoicesType;
    //                   String newresults = _selectedAnimals2;
    //                   print(_selectedtype.toString());
    //
    //                   selectedChoicesType.contains(results)
    //                   ? selectedChoicesType.remove(results)
    //                       : selectedChoicesType.add(results);
    //                   widget.onSelectionChanged?.call(selectedChoicesType);
    //                 },
    // );},
    //                 chipDisplay: MultiSelectChipDisplay(
    //                   onTap: (value) {
    //                     setState(() {
    //                       _selectedAnimals2.remove(value);
    //                     });
    //                   },
    //                 ),
    //               )
    //             ],
    //           )),
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

    for (var item in _era) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: FilterChip(
          label: Text(item),
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

    for (var item in _class) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: FilterChip(
          label: Text(item),
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

    for (var item in _grade) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: FilterChip(
          label: Text(item),
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
      _selectedseries.clear();
      _selectedera.clear();
      _selectedclass.clear();
      _selectedgrade.clear();
    });
  }
  Widget _titleContainer(String myTitle) {
    return Text(
      myTitle,
      style: const TextStyle(
          color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }


}
