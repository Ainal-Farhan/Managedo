import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../viewmodel.dart';

class StudentPerformanceGraphViewmodel extends Viewmodel {
  List<charts.Series<PerformanceAllSem, String>> _series;
  set series(List<charts.Series<PerformanceAllSem, String>> series) =>
      this._series = series;
  List<charts.Series<PerformanceAllSem, String>> get series => _series;

  charts.BarChart _barChart;
  set barChart(charts.BarChart barChart) => this._barChart = barChart;
  charts.BarChart get barChart => _barChart;

  void setAll() {
    final data = [
      PerformanceAllSem('Sem1', 4.00, Colors.red),
      PerformanceAllSem('Sem2', 3.87, Colors.red),
      PerformanceAllSem('Sem3', 3.56, Colors.red),
      PerformanceAllSem('Sem4', 3.62, Colors.red),
      // PerformanceAllSem('Sem5', 3.87, Colors.red),
      // PerformanceAllSem('Sem6', 3.78, Colors.red),
      // PerformanceAllSem('Sem7', 3.67, Colors.red),
      // PerformanceAllSem('Sem8', 2.00, Colors.red),
    ];

    final data2 = [
      PerformanceAllSem('Sem1', 3.00, Colors.blue),
      PerformanceAllSem('Sem2', 2.87, Colors.blue),
      PerformanceAllSem('Sem3', 3.56, Colors.blue),
      PerformanceAllSem('Sem4', 2.62, Colors.blue),
      // PerformanceAllSem('Sem5', 1.87, Colors.blue),
      // PerformanceAllSem('Sem6', 2.78, Colors.blue),
      // PerformanceAllSem('Sem7', 1.67, Colors.blue),
      // PerformanceAllSem('Sem8', 4.00, Colors.blue),
    ];

    series = [
      charts.Series(
        id: 'Real GPA',
        domainFn: (PerformanceAllSem performanceAllSem, _) =>
            performanceAllSem.semester,
        measureFn: (PerformanceAllSem performanceAllSem, _) =>
            performanceAllSem.gpa,
        colorFn: (PerformanceAllSem performanceAllSem, _) =>
            performanceAllSem.color,
        data: data,
        labelAccessorFn: (PerformanceAllSem performanceAllSem, _) =>
            performanceAllSem.gpa.toStringAsFixed(2),
      ),
      charts.Series(
        id: 'Targeted GPA',
        domainFn: (PerformanceAllSem performanceAllSem, _) =>
            performanceAllSem.semester,
        measureFn: (PerformanceAllSem performanceAllSem, _) =>
            performanceAllSem.gpa,
        colorFn: (PerformanceAllSem performanceAllSem, _) =>
            performanceAllSem.color,
        data: data2,
        labelAccessorFn: (PerformanceAllSem performanceAllSem, _) =>
            performanceAllSem.gpa.toStringAsFixed(2),
      ),
    ];

    barChart = charts.BarChart(
      series,
      animate: true,
      barGroupingType: charts.BarGroupingType.grouped,
      behaviors: [
        charts.SeriesLegend(
          position: charts.BehaviorPosition.top,
          outsideJustification: charts.OutsideJustification.endDrawArea,
          horizontalFirst: true,
          desiredMaxRows: 2,
          desiredMaxColumns: 1,
          cellPadding: EdgeInsets.only(bottom: 3.0),
          entryTextStyle: charts.TextStyleSpec(
              color: charts.Color(r: 0, g: 0, b: 0),
              fontFamily: 'Georgia',
              fontSize: 11),
        ),
      ],
      barRendererDecorator: data.length < 5 && data2.length < 5
          ? charts.BarLabelDecorator<String>()
          : null,
      domainAxis:
          data.length < 5 && data2.length < 5 ? charts.OrdinalAxisSpec() : null,
    );
  }

  charts.Color setColor(Color color) =>
      charts.Color(r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class PerformanceAllSem {
  final String semester;
  final double gpa;
  final charts.Color color;

  PerformanceAllSem(this.semester, this.gpa, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
