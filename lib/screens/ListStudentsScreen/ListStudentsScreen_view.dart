import 'package:flutter/material.dart';

import './components/body.dart';
import 'components/bar.dart';
import '../view.dart';
import './ListStudents_viewmodel.dart';

class ListStudentsScreen extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => ListStudentsScreen());

  @override
  ListStudentsState createState() => ListStudentsState();
}

class ListStudentsState extends State<ListStudentsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListStudentsView(
        // state: this,
        );
  }
}

class ListStudentsView extends StatelessWidget {
  // final ListStudentsState _state;
  // ListStudentsView({state}) : _state = state;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(),
          body: View<ListStudentsViewmodel>(
            initViewmodel: (viewmodel) => viewmodel,
            builder: (context, viewmodel, _) {
              return Body();
            },
          ),
        ),
      ),
    );
  }
}
