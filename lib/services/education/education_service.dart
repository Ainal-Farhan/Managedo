import 'package:managedo_mobile_app/models/education.dart';

abstract class EducationService {
  Future<Education> getEducation(int id);
  Future<List<Education>> getEducationListBasedOnStudentId(int studentId);
}
