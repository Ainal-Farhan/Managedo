import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/float.dart';

import 'SemesterList_viewmodel.dart';
import '../view.dart';


class SemesterListViewArguments {
  final int educationId;
  final int studentId;

  SemesterListViewArguments({@required this.educationId, @required this.studentId});
}
class SemesterListView extends StatelessWidget {
  final int educationId;
  final int studentId;

  SemesterListView({@required this.educationId, @required this.studentId});

  static Route<dynamic> route({@required educationId,@required studentId}) => MaterialPageRoute(
      builder: (_) => SemesterListView(educationId: educationId, studentId: studentId,));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: SafeArea(
          child: Scaffold(
            body: View<SemesterListViewmodel>(
              initViewmodel: (viewmodel) =>
                  viewmodel.init(educationId: educationId),
              builder: (context, viewmodel, _) => Body(
                viewmodel: viewmodel,
                state: this,
              ),
            ),
            floatingActionButton: Float(
              state: this
            ),
          ),
        ));
  }
}
