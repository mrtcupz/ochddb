import 'package:flutter/material.dart';
import 'package:ochdappupdated/MainOCHDPage.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

import 'Database.dart';
import 'main.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String appBarText;
  CustomAppBar(this.appBarText);
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  _CustomAppBar createState() => _CustomAppBar(this.appBarText);
}
class _CustomAppBar extends State<CustomAppBar> {
  _CustomAppBar(this.appBarText);
  late String appBarText;
  bool isSwitched = Database().responsedarkorlight()?? false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Text(
          appBarText,style: TextStyle(color: Colors.blue)
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_sharp,
            color: Colors.blue),
            onPressed: () =>    Navigator.pop(context)

        ),
    );
  }
  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainOCHDPage()),
    );

    //below you can get your result and update the view with setState
    //changing the value if you want, i just wanted know if i have to
    //update, and if is true, reload state

    if (result) {
      setState(() {});
    }
  }
}
