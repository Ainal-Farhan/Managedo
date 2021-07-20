import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/education.dart';
import 'package:managedo_mobile_app/services/education/education_service.dart';

import '../viewmodel.dart';

class AddEducationViewmodel extends Viewmodel {
  TextEditingController universityNameController =
      TextEditingController(text: '');
  TextEditingController fieldController = TextEditingController(text: '');
  String degree = 'Diploma';
  DateTime startDate = DateTime.now();
  TextEditingController targetedCGPAController =
      TextEditingController(text: '');
  TextEditingController achievedCGPAController =
      TextEditingController(text: '');

  EducationService get educationDataService => dependency();

  Future<bool> addEducation({@required int studentId}) async {
    Education education = new Education(
        universityName: universityNameController.text,
        field: fieldController.text,
        degreeLevel: degree,
        startDate: startDate,
        targetedCGPA: double.parse(targetedCGPAController.text),
        achievedCGPA: double.parse(achievedCGPAController.text));
    return await educationDataService.adddNewEducation(education);
  }
}
