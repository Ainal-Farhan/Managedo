import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  Bar({@required this.title});

  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      title: Text(title),
      centerTitle: true,
      actions: [
        Container(
          margin: EdgeInsets.all(0),
          height: 40,
          width: 40,
          child: Center(
            child: IconButton(
              iconSize: 20,
              icon: Icon(Icons.delete),
              onPressed: () => _showAlert(context),
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete This Semester Information?'),
          content: Text("Are You Sure Want To Proceed?"),
          actions: <Widget>[
            TextButton(
              child: Text("YES"),
              onPressed: () {
                //Put your code here which you want to execute on Yes button click.
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("NO"),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
