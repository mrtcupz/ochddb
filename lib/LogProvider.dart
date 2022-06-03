import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogProvider extends ChangeNotifier{

  late List _selectedtype;
  List _selectedseries = [];
  List _selectedera = [];
  List _selectedclass = [];
  List _selectedgrade = [];


   addValue(List value){
    print("cart value added");
    print(value);
    _selectedtype = value;
    print("big test below");
    print(_selectedtype);
    notifyListeners();


  }

  getTypeList(){
    print("below");

    print(_selectedtype);
    print("testing the get for type");
    return _selectedtype;
  }
 // final nameChangeNotifier =
 // ChangeNotifierProvider.autoDispose<LogProvider>((ref) {
 //   return LogProvider();
 // });
}
