import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import './components/body.dart';
import './components/bar.dart';
import '../view.dart';
import './ListStudents_viewmodel.dart';
import '../../app/router.dart' as router;

class ListStudentsScreen extends StatefulWidget {
  final int parentId;

  ListStudentsScreen({@required this.parentId});

  static Route<dynamic> route({@required parentId}) =>
      MaterialPageRoute(builder: (_) => ListStudentsScreen(parentId: parentId));

  @override
  ListStudentsState createState() => ListStudentsState();
}

class ListStudentsState extends State<ListStudentsScreen> {
  int _currentPage = 1;

  int get currentPage => _currentPage;
  set currentPage(int currentPage) => this._currentPage = currentPage;

  void setCurrentPage(int position) {
    setState(() {
      currentPage = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListStudentsView(
      state: this,
    );
  }
}

class ListStudentsView extends StatelessWidget {
  final ListStudentsState _state;
  ListStudentsView({state}) : _state = state;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: Bar(),
          body: View<ListStudentsViewmodel>(
            initViewmodel: (viewmodel) =>
                viewmodel.init(parentId: _state.widget.parentId),
            builder: (context, viewmodel, _) {
              return Body(viewmodel: viewmodel);
            },
          ),
          bottomNavigationBar: FancyBottomNavigation(
              circleColor: Colors.green,
              initialSelection: _state.currentPage,
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
                  case 0:
                    return Navigator.of(context).pushReplacementNamed(
                        router.parentHomeRoute,
                        arguments: _state.widget.parentId);
                }
              }),
        ),
      ),
    );
  }
}
