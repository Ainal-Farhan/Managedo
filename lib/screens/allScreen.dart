import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/app/router.dart';

class AllScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => AllScreen());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('This is screen for navigating to other screen'),
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Text('Education List (rest required)'),
                  trailing: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () async =>
                        await Navigator.pushNamed(context, educationRoute, arguments: 1),
                  ),
                ),
                ListTile(
                  title: Text('student List'),
                  trailing: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () async =>
                        await Navigator.pushNamed(context, listStudentsRoute),
                  ),
                ),
                ListTile(
                  title: Text('Example'),
                  trailing: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () async =>
                        await Navigator.pushNamed(context, exampleRoute),
                  ),
                ),
                ListTile(
                  title: Text('Loading Screen'),
                  trailing: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () async =>
                        await Navigator.pushNamed(context, loadingScreenRoute),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
