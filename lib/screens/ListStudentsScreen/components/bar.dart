import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.school_sharp),
      title: Text('List of Students'),
      centerTitle: true,
    );
  }
}
