import 'package:flutter/material.dart';

import 'package:managedo_mobile_app/screens/EducationInfoScreen/EducationInfo_view.dart';
import 'package:managedo_mobile_app/screens/ExampleScreen/Example_view.dart';
import 'package:managedo_mobile_app/screens/ListStudentsScreen/ListStudentsScreen_view.dart';
import 'package:managedo_mobile_app/screens/SemesterListScreen/SemesterList_view.dart';
import 'package:managedo_mobile_app/screens/StudentPerformanceScreen/StudentPerformanceGraph_view.dart';

const String educationRoute = '/education';
const String listStudentsRoute = '/listStudents';
const String listSemestersRoute = '/listSemesters';
const String performanceGraphRoute = '/performanceGraph';
const String exampleRoute = '/example';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case educationRoute:
      return EducationInfoView.route();
    case exampleRoute:
      return ExampleView.route();
    case listStudentsRoute:
      return ListStudentsScreen.route();
    case listSemestersRoute:
      return SemesterListView.route();
    case performanceGraphRoute:
      return StudentPerformanceGraph.route();
  }
  return null;
}
