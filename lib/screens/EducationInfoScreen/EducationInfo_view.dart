import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import './components/body.dart';

import '../view.dart';
import 'EducationInfo_viewmodel.dart';

class EducationInfo extends StatefulWidget {
  final int studentId;

  EducationInfo({@required this.studentId});

  static Route<dynamic> route({@required studentId}) => MaterialPageRoute(
      builder: (_) => EducationInfo(
            studentId: studentId,
          ),
        );

  @override
  EducationInfoState createState() => EducationInfoState();
}

class EducationInfoState extends State<EducationInfo> {
  int currentPage = 2;

  String currentProcess = 'init';
  int deletingEducationId = -1;

  void deleteSelectedEducation({@required int educationId}) {
    currentProcess = 'delete';
    deletingEducationId = educationId;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu_book_rounded),
            title: Text('Education Information'),
            centerTitle: true,
          ),
          body: View<EducationInfoViewmodel>(
            initViewmodel: (viewmodel) => currentProcess == 'init'
                ? viewmodel.init(studentId: widget.studentId)
                : currentProcess == 'delete'
                    ? viewmodel.deleteSelectedEducation(
                        educationId: deletingEducationId, state: this)
                    : viewmodel,
            builder: (context, viewmodel, _) {
              return Body(state: this, viewmodel: viewmodel);
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => {},
          ),
          bottomNavigationBar: FancyBottomNavigation(
            circleColor: Colors.green,
            initialSelection: currentPage,
            tabs: [
              TabData(
                iconData: Icons.person,
                title: 'Profile',
              ),
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
              setState(() {
                currentPage = position;
              });
            },
          ),
        ),
      ),
    );
  }
}
