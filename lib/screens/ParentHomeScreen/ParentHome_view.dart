import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import '../view.dart';
import 'ParentHome_viewmodel.dart';
import '../../app/router.dart' as router;

class ParentHomeScreen extends StatelessWidget {
  final int currentPage = 0;
  final int parentId;

  ParentHomeScreen({this.parentId});

  static Route<dynamic> route({int parentId}) => MaterialPageRoute(
      builder: (_) => ParentHomeScreen(
            parentId: parentId,
          ));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text('Home Screen'),
            centerTitle: true,
          ),
          body: View<ParentHomeViewmodel>(
            initViewmodel: (viewmodel) => viewmodel,
            builder: (context, viewmodel, _) {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home),
                    Text(
                      'Home Screen',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: FancyBottomNavigation(
            circleColor: Colors.green,
            initialSelection: currentPage,
            tabs: [
              TabData(
                iconData: Icons.home,
                title: 'Home',
              ),
              TabData(
                iconData: Icons.school_sharp,
                title: 'Students',
              ),
            ],
            onTabChangedListener: (int position) {
              switch (position) {
                case 1:
                  return Navigator.of(context).pushReplacementNamed(
                      router.listStudentsRoute,
                      arguments: parentId);
              }
            },
          ),
        ),
      ),
    );
  }
}
