import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('List of Semester'),
      leading: Icon(
        Icons.bookmarks_sharp,
      ),
      centerTitle: true,
    );
  }
}
