import '../../models/student.dart';

abstract class StudentService {
  Future<List<Student>> getStudentList();
}