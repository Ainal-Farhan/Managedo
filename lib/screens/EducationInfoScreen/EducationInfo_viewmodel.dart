import 'package:managedo_mobile_app/models/education.dart';
import 'package:managedo_mobile_app/services/education/education_service.dart';

import '../../app/dependencies.dart';

import '../viewmodel.dart';

class EducationInfoViewmodel extends Viewmodel {
  List<Education> educations;
  EducationService get educationDataService => dependency();

  Future<void> getEducationListBasedOnStudentId(int studentId) async {
    turnBusy();
    await educationDataService
        .getEducationListBasedOnStudentId(studentId)
        .then((educationsList) {
      educations = educationsList;
    });

    turnIdle();
  }
}
