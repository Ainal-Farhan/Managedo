import 'package:managedo_mobile_app/models/semester.dart';

abstract class SemesterService {
  Future<List<Semester>> getAllSemesters();

  Future<List<Semester>> getAllSemesterBasedOnEducationId(int educationId);

  Future<Semester> getSemesterBasedOnId(int semesterId);
}
