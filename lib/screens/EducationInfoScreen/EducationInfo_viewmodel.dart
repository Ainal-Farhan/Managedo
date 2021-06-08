import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/models/education.dart';
import 'package:managedo_mobile_app/screens/EducationInfoScreen/EducationInfo_view.dart';
import 'package:managedo_mobile_app/services/education/education_service.dart';

import '../../app/dependencies.dart';

import '../viewmodel.dart';

class EducationInfoViewmodel extends Viewmodel {
  List<Education> educations;
  EducationService get educationDataService => dependency();

  Future<void> init({@required int studentId}) async {
    turnBusy();
    await educationDataService.getEducationList().then((educationsList) {
      educations = educationsList;
    });

    turnIdle();
  }

  Future<void> deleteSelectedEducation(
      {int educationId, EducationInfoState state}) async {
    turnBusy();

    final isDeleted =
        await educationDataService.deleteSelectedEducation(educationId);

    print('delete status: $isDeleted with educationId: $educationId');

    await educationDataService.getEducationList().then((educationsList) {
      educations = educationsList;
    });

    turnIdle();
  }
}
