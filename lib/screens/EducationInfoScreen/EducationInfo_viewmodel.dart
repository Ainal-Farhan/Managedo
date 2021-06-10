import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/models/education.dart';
import 'package:managedo_mobile_app/services/education/education_service.dart';

import '../../app/dependencies.dart';

import '../viewmodel.dart';

class EducationInfoViewmodel extends Viewmodel {
  List<Education> educations;
  static EducationService get educationDataService => dependency();

  Future<void> init({@required int studentId}) async {
    turnBusy();
    await educationDataService.getEducationList().then((educationsList) {
      educations = educationsList;
    });

    turnIdle();
  }

  static Future<bool> deleteSelectedEducation({int educationId}) async {

    return await educationDataService.deleteSelectedEducation(educationId);
  }
}
