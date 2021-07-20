import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/LoadingScreen/LoadingScreen.dart';
import 'package:managedo_mobile_app/LoadingScreen/LoadingScreenArguments.dart';
import 'package:managedo_mobile_app/screens/AddEducationScreen/AddEducation_view.dart';
import 'package:managedo_mobile_app/screens/AddSemesterScreen/AddSemester_view.dart';
import 'package:managedo_mobile_app/screens/AllEducationsPerformanceScreen/AllEducationsPerformance_view.dart';
import 'package:managedo_mobile_app/screens/EditEducationScreen/EditEducation_view.dart';

import 'package:managedo_mobile_app/screens/EducationInfoScreen/EducationInfo_view.dart';
import 'package:managedo_mobile_app/screens/ListStudentsScreen/ListStudentsScreen_view.dart';
import 'package:managedo_mobile_app/screens/ParentHomeScreen/ParentHome_view.dart';
import 'package:managedo_mobile_app/screens/SemesterDetailsScreen/SemesterDetails_view.dart';
import 'package:managedo_mobile_app/screens/SemesterListScreen/SemesterList_view.dart';
import 'package:managedo_mobile_app/screens/StudentHomeScreen/StudentHome_view.dart';
import 'package:managedo_mobile_app/screens/StudentPerformanceScreen/StudentPerformanceGraph_view.dart';
import 'package:managedo_mobile_app/screens/LoginScreen/LoginScreen_view.dart';
import 'package:managedo_mobile_app/screens/allScreen.dart';

const String educationRoute = '/education';
const String listStudentsRoute = '/listStudents';
const String listSemestersRoute = '/listSemesters';
const String performanceGraphRoute = '/performanceGraph';
const String semesterDetailsRoute = '/semesterDetails';
const String allScreenRoute = '/allScreen';
const String loadingScreenRoute = '/loading';
const String allEducationPerformanceRoute = '/allEducationsPerformance';
const String loginScreenRoute = '/loginScreenRoute';
const String addEducationScreenRoute = '/addEducationScreenRoute';
const String editEducationScreenRoute = '/editEducationScreenRoute';
const String addSemesterRoute = '/addSemesterRoute';
const String parentHomeRoute = '/parentHomeRoute';
const String studentHomeRoute = '/studentHomeRoute';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case parentHomeRoute:
      return ParentHomeScreen.route(parentId: settings.arguments);
    case studentHomeRoute:
      return StudentHomeScreen.route(studenId: settings.arguments);
    case addSemesterRoute:
      return AddSemester.route();
    case editEducationScreenRoute:
      return EditEducationScreen.route(education: settings.arguments);
    case loginScreenRoute:
      return LoginScreen.route();
    case addEducationScreenRoute:
      return AddEducationScreen.route(studentId: settings.arguments);
    case educationRoute:
      return EducationInfo.route(studentId: settings.arguments);
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
