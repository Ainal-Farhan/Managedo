import 'package:flutter/material.dart';

import 'package:managedo_mobile_app/screens/EducationInfoScreen/EducationInfo_view.dart';

const String homeRoute = '/home';
const String loginRoute = '/login';
const String educationRoute = '/education';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case educationRoute:
      return EducationInfoScreen.route();
  }
  return null;
}
