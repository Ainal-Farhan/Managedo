import 'package:flutter/material.dart';
import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/education.dart';
import 'package:managedo_mobile_app/services/education/education_service.dart';

import '../viewmodel.dart';

class EditEducationViewmodel extends Viewmodel {
  TextEditingController universityNameController =
      TextEditingController(text: '');
  TextEditingController fieldController = TextEditingController(text: '');
  TextEditingController targetedCGPAController =
      TextEditingController(text: '');
  TextEditingController achievedCGPAController =
      TextEditingController(text: '');

  EducationService get educationDataService => dependency();

  Education education;

  init({Education education}) {
    this.education = education;
    universityNameController.text = education.universityName;
    fieldController.text = education.field;
    targetedCGPAController.text = education.targetedCGPA.toString();
    achievedCGPAController.text = education.achievedCGPA.toString();
  }

  Future<bool> updateEducation() async {
    this.education.universityName = universityNameController.text;
    this.education.field = fieldController.text;
    this.education.targetedCGPA = double.parse(targetedCGPAController.text);
    this.education.achievedCGPA = double.parse(achievedCGPAController.text);
    return await educationDataService.updateEducation(this.education);
  }
}
