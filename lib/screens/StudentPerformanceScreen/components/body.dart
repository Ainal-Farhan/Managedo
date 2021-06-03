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
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomBarChart(
                  barChart: _barChart,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 80,
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.auto_graph_outlined,
                color: Colors.white,
              ),
              Text(
                ' Performance Graph',
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
