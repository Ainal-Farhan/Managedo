import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import './components/body.dart';
import './components/bar.dart';
import '../view.dart';
import './ListStudents_viewmodel.dart';

class ListStudentsScreen extends StatefulWidget {
  final int parentId;

  ListStudentsScreen({@required this.parentId});

  static Route<dynamic> route({@required parentId}) =>
      MaterialPageRoute(builder: (_) => ListStudentsScreen(parentId: parentId));

  @override
  ListStudentsState createState() => ListStudentsState();
}

class ListStudentsState extends State<ListStudentsScreen> {
  int _currentPage = 2;

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
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
                iconData: Icons.person,
                title: 'Profile',
              ),
              TabData(
                iconData: Icons.home,
                title: 'Home',
              ),
              TabData(
                iconData: Icons.school_sharp,
                title: 'Students',
              ),
            ],
            onTabChangedListener: (int position) =>
                _state.setCurrentPage(position),
          ),
        ),
      ),
    );
  }
}
