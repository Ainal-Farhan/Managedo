import 'package:flutter/material.dart';

import './components/float.dart';
import '../view.dart';
import './StudentPerformanceGraph_viewmodel.dart';
import './components/body.dart';
import './components/bar.dart';

class StudentPerformanceGraph extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => StudentPerformanceGraph());

  @override
  StudentPerfomanceGraphState createState() => StudentPerfomanceGraphState();
}

class StudentPerfomanceGraphState extends State<StudentPerformanceGraph> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(),
          body: View<StudentPerformanceGraphViewmodel>(
            initViewmodel: (viewmodel) => viewmodel.init(),
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
