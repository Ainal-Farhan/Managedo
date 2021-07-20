import 'package:flutter/material.dart';
import '../../../app/router.dart' as router;

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.school_sharp),
      title: Text('List of Students'),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Logout"),
                    content: Text("You want to Logout?"),
                    actions: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(
                            context, router.loginScreenRoute, (route) => false),
                      ),
                      TextButton(
                        child: Text("CANCEL"),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.login_rounded))
      ],
    );
  }
}
