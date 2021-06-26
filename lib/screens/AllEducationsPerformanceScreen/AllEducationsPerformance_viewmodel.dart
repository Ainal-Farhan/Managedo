import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/education.dart';
import 'package:managedo_mobile_app/services/education/education_service.dart';
import 'package:managedo_mobile_app/services/semester/semester_service.dart';

import '../viewmodel.dart';

class AllEducationsPerformanceViewmodel extends Viewmodel {
  SemesterService get _semesterService => dependency();
  EducationService get _educationService => dependency();

  List<charts.BarChart> _barChart = [];
  set barChart(List<charts.BarChart> barChart) => this._barChart = barChart;
  List<charts.BarChart> get barChart => _barChart;

  List<Education> educations = [];

  void init({@required fkStudentId}) async {
    turnBusy();
    barChart = [];

    await _educationService
        .getEducationListBasedOnStudentId(fkStudentId)
        .then((educationList) async {
      if (educationList == null || educationList.isEmpty) return;

      educations = educationList;

      await Future.wait(educationList.map((education) async {
        await _semesterService
            .getAllSemesterBasedOnEducationId(education.id)
            .then((semesterList) {
          if (semesterList.length == 0) return;

          final List<PerformanceAllSem> data = [];
          semesterList.forEach((semester) {
            data.add(PerformanceAllSem('Sem #${semester.semesterNo}',
                semester.achievedGPA, Colors.blue));
          });

          final List<PerformanceAllSem> data2 = [];
          semesterList.forEach((semester) {
            data2.add(PerformanceAllSem('Sem #${semester.semesterNo}',
                semester.targetedGPA, Colors.red));
          });

          List<charts.Series<PerformanceAllSem, String>> series = [
            charts.Series(
              id: 'Achieved GPA',
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

          barChart.add(charts.BarChart(
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
            domainAxis: data.length < 5 && data2.length < 5
                ? charts.OrdinalAxisSpec()
                : null,
          ));
        });
      }));
    });

    turnIdle();
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
