import 'package:flutter/material.dart';
import './components/body.dart';

import '../view.dart';
import 'EducationInfo_viewmodel.dart';

class EducationInfoView extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => EducationInfoView());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text('Education Information'),
            centerTitle: true,
          ),
          body: View<EducationInfoViewmodel>(
            initViewmodel: (viewmodel) =>
                viewmodel.getEducationListBasedOnStudentId(1),
            builder: (context, viewmodel, _) {
              return Body(state: this, viewmodel: viewmodel);
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => {},
          ),
        ),
      ),
    );
  }
}
