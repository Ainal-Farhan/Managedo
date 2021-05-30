import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/screens/StudentPerformanceScreen/StudentPerformanceGraph_view.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'custom_bar_chart.dart';

class Body extends StatelessWidget {
  final StudentPerfomanceGraphState _state;
  final charts.BarChart _barChart;

  Body({state, barChart})
      : _state = state,
        _barChart = barChart;

  StudentPerfomanceGraphState get state => _state;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CustomBarChart(
            barChart: _barChart,
          ),
        ],
      ),
    );
  }
}
