import 'package:flutter/material.dart';

import './components/float.dart';
import '../view.dart';
import './AllEducationsPerformance_viewmodel.dart';
import './components/body.dart';

class AllEducationsPerformance extends StatefulWidget {
  final int fkStudentId;

  AllEducationsPerformance({@required this.fkStudentId});

  static Route<dynamic> route({@required fkStudentId}) => MaterialPageRoute(
      builder: (_) => AllEducationsPerformance(
            fkStudentId: fkStudentId,
          ));

  @override
  AllEducationsPerformanceState createState() =>
      AllEducationsPerformanceState();
}

class AllEducationsPerformanceState extends State<AllEducationsPerformance> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: View<AllEducationsPerformanceViewmodel>(
            initViewmodel: (viewmodel) =>
                viewmodel.init(fkStudentId: widget.fkStudentId),
            builder: (context, viewmodel, _) {
              return Body(
                state: this,
                barChart: viewmodel.barChart,
                educations: viewmodel.educations,
              );
            },
          ),
          floatingActionButton: Float(),
        ),
      ),
    );
  }
}
