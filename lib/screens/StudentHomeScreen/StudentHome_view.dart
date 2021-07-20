import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import '../view.dart';
import './StudentHome_viewmodel.dart';
import '../../app/router.dart' as router;

class StudentHomeScreen extends StatelessWidget {
  final int currentPage = 0;
  final int studentId;

  StudentHomeScreen({this.studentId});

  static Route<dynamic> route({int studenId}) => MaterialPageRoute(
      builder: (_) => StudentHomeScreen(
            studentId: studenId,
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
          body: View<StudentHomeViewmodel>(
            initViewmodel: (viewmodel) => viewmodel,
            builder: (context, viewmodel, _) {
              return Card(
                child: Text('Home Screen'),
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
                iconData: Icons.menu_book_rounded,
                title: 'Education',
              ),
            ],
            onTabChangedListener: (int position) {
              switch (position) {
                case 1:
                  return Navigator.of(context).pushReplacementNamed(
                      router.educationRoute,
                      arguments: studentId);
              }
            },
          ),
        ),
      ),
    );
  }
}
