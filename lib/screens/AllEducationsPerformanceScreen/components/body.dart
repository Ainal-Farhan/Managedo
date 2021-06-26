import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/models/education.dart';
import 'package:managedo_mobile_app/screens/AllEducationsPerformanceScreen/AllEducationsPerformance_view.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'custom_bar_chart.dart';

class Body extends StatelessWidget {
  final AllEducationsPerformanceState _state;
  final List<charts.BarChart> _barChart;
  final List<Education> _educations;

  Body({state, barChart, educations})
      : _state = state,
        _barChart = barChart,
        _educations = educations;

  AllEducationsPerformanceState get state => _state;

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: ListView(
              children: _barChart
                  .map((bar) => CustomBarChart(
                        barChart: bar,
                        education: _educations[index++],
                      ))
                  .toList(),
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
