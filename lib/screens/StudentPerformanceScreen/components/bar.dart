import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      title: Text('Performance Graph'),
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      centerTitle: true,
    );
  }
}
