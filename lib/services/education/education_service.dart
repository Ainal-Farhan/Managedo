import 'package:managedo_mobile_app/models/education.dart';

abstract class EducationService {
  Future<Education> getEducation(int id);
  Future<List<Education>> getEducationListBasedOnStudentId(int studentId);
  Future<List<Education>> getEducationList();
  Future<bool> deleteSelectedEducation(int educationId);
  Future<bool> adddNewEducation(Education education);
  Future<bool> updateEducation(Education education);
}
