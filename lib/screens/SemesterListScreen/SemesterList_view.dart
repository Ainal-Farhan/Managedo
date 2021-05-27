import 'package:flutter/material.dart';
import 'components/bar.dart';
import 'components/body.dart';
import 'components/float.dart';

import 'SemesterList_viewmodel.dart';
import '../view.dart';

class SemesterListView extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => SemesterListView());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: SafeArea(
          child: Scaffold(
            appBar: Bar(),
            body: View<SemesterListViewmodel>(
              initViewmodel: (viewmodel) => viewmodel,
              builder: (context, viewmodel, _) => Body(),
            ),
            floatingActionButton: Float(),
          ),
        ));
  }
}
