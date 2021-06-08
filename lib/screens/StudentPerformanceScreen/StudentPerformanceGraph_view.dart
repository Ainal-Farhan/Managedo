import 'package:flutter/material.dart';

import './components/float.dart';
import '../view.dart';
import './StudentPerformanceGraph_viewmodel.dart';
import './components/body.dart';

class StudentPerformanceGraph extends StatefulWidget {
  final int fkEducationId;

  StudentPerformanceGraph({@required this.fkEducationId});

  static Route<dynamic> route({@required fkEducationId}) =>
      MaterialPageRoute(builder: (_) => 
        StudentPerformanceGraph(fkEducationId: fkEducationId,)
    );

  @override
  StudentPerfomanceGraphState createState() => StudentPerfomanceGraphState();
}

class StudentPerfomanceGraphState extends State<StudentPerformanceGraph> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: View<StudentPerformanceGraphViewmodel>(
            initViewmodel: (viewmodel) => viewmodel.init(fkEducationId: widget.fkEducationId),
            builder: (context, viewmodel, _) {
              return Body(
                state: this,
                barChart: viewmodel.barChart,
              );
            },
          ),
          floatingActionButton: Float(),
        ),
      ),
    );
  }
}
