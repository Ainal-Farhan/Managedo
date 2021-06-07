import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/semester.dart';
import 'package:managedo_mobile_app/services/semester/semester_service.dart';

import '../viewmodel.dart';

class SemesterListViewmodel extends Viewmodel {
  SemesterService get _semesterService => dependency();

  List<Semester> semesterList;

  init({@required educationId}) async {
    turnBusy();
    semesterList = await _semesterService
        .getAllSemesterBasedOnEducationId(educationId)
        .catchError((err) {
      return null;
    });
    
    turnIdle();
  }
}
