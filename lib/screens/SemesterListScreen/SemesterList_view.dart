import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/float.dart';

import 'SemesterList_viewmodel.dart';
import '../view.dart';

class SemesterListView extends StatelessWidget {
  final int educationId;

  SemesterListView({@required this.educationId});

  static Route<dynamic> route({@required educationId}) =>
      MaterialPageRoute(builder: (_) => SemesterListView(educationId:educationId));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(true),
        child: SafeArea(
          child: Scaffold(
            body: View<SemesterListViewmodel>(
              initViewmodel: (viewmodel) => viewmodel.init(educationId: educationId),
              builder: (context, viewmodel, _) => Body(viewmodel: viewmodel),
            ),
            floatingActionButton: Float(),
          ),
        ));
  }
}
