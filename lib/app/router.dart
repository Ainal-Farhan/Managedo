import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/LoadingScreen/LoadingScreen.dart';
import 'package:managedo_mobile_app/LoadingScreen/LoadingScreenArguments.dart';
import 'package:managedo_mobile_app/screens/AllEducationsPerformanceScreen/AllEducationsPerformance_view.dart';

import 'package:managedo_mobile_app/screens/EducationInfoScreen/EducationInfo_view.dart';
import 'package:managedo_mobile_app/screens/ExampleScreen/Example_view.dart';
import 'package:managedo_mobile_app/screens/ListStudentsScreen/ListStudentsScreen_view.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_view.dart';
import 'package:managedo_mobile_app/screens/SemesterListScreen/SemesterList_view.dart';
import 'package:managedo_mobile_app/screens/StudentPerformanceScreen/StudentPerformanceGraph_view.dart';
import 'package:managedo_mobile_app/screens/allScreen.dart';

const String educationRoute = '/education';
const String listStudentsRoute = '/listStudents';
const String listSemestersRoute = '/listSemesters';
const String performanceGraphRoute = '/performanceGraph';
const String semesterDetailsRoute = '/semesterDetails';
const String exampleRoute = '/example';
const String allScreenRoute = '/allScreen';
const String loadingScreenRoute = '/loading';
const String allEducationPerformanceRoute = '/allEducationsPerformance';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case educationRoute:
      return EducationInfo.route(studentId: settings.arguments);
    case exampleRoute:
      return ExampleView.route();
    case listStudentsRoute:
      return ListStudentsScreen.route(parentId: settings.arguments);
    case listSemestersRoute:
      final args = settings.arguments;
      return SemesterListView.route(
          educationId: args.educationId, studentId: args.studentId);
    case performanceGraphRoute:
      return StudentPerformanceGraph.route(fkEducationId: settings.arguments);
    case semesterDetailsRoute:
      final SemesterDetailsArguments args = settings.arguments;
      return SemesterDetailsView.route(
          semesterId: args.semesterId,
          educationId: args.educationId,
          studentId: args.studentId);
    case allScreenRoute:
      return AllScreen.route();
    case allEducationPerformanceRoute:
      return AllEducationsPerformance.route(fkStudentId: settings.arguments);
    case loadingScreenRoute:
      final LoadingScreenArguments args = settings.arguments;
      return MaterialPageRoute(
          builder: (_) => LoadingScreen(
                processes: args.processes,
                nextScreenRoute: args.nextScreenRoute,
                nextScreenArguments: args.nextScreenArguments,
                backgroundColor: args.backgroundColor,
                image: args.image,
                initialMessage: args.image,
                loaderColor: args.loaderColor,
                styleTextUnderTheLoader: args.styleTextUnderTheLoader,
                title: args.title,
              ));
  }
  return null;
}
