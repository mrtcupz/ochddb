import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ochdappupdated/models/JumputiChars.dart';

class Database extends GetxController {
  final box = GetStorage();


  Future<void> initStorage() async {
    await GetStorage.init();
  }

  void storePriceModel(chars) {
    box.write('chars', chars);
   // print("box object");
   // print(box.read("chars").toString().length);
  }
  void storePriceModellegend(chars) {
    box.write('legend', chars);
    // print("box object");
    // print(box.read("chars").toString().length);
  }
  clear() {
    box.erase();
  }
  responsejson(chars) {
    box.write('response', chars);
  }
  responsejsonlegend(chars) {
    box.write('responseleg', chars);
  }
  responseType(value) {
    box.write('Type', value);
    print(box.read("Type"));
    print("response type added");
  }
  responseTypeLegend(value) {
    print("4skin");
    print(value);
    box.write('TypeLegend', value);
  }
  responseClass(value) {
    box.write('Class', value);
  }
  darkorlight(value) {
    box.write('theme', value);
  }
  cleardarkorlight() {
    box.remove('theme');
  }
  responsedarkorlight() {
    final _return =box.read('theme');
    return _return;
  }
  responseEra(value) {
    box.write('Era', value);
  }
  responseGrade(value) {
    box.write('Grade', value);
  }
  clearGrade() {
    box.remove("Grade");
  }
  clearEra() {
    box.remove("Era");
  }
  clearType() {
    box.remove("Type");
  }
  clearTypelegend() {
    box.remove("Typelegend");
  }
  clearClass() {
    box.remove("Class");
  }
  responsereadTypelegend() {
    print("5skin");
    final _return =box.read('TypeLegend');
    return _return;
  }
  responsereadType() {
    final _return =box.read('Type');
    return _return;
  }
  responsereadEra() {
    final _return =box.read('Era');
    return _return;
  }
  responsereadGrade() {
    final _return =box.read('Grade');
    return _return;
  }
  responsereadClass() {
    final _return =box.read('Class');
    return _return;
  }
  responseread() {
    final _return =box.read('response');
    return _return;
  }
  responsereadlegend() {
    final _return =box.read('responseleg');
    return _return;
  }
  List<JumputiChars> read() {
    List<JumputiChars> _return = box.read('chars');
    print(_return.toString());
    print(_return.length);
    print("read above");

    return _return;
  }

  JumputiChars restoreModel() {
    final map = box.read('chars') ?? {};
    return JumputiChars.fromJson(map);
  }
  JumputiChars readModel() {
    final map = box.read('chars') ?? {};
    return map;
  }
}
