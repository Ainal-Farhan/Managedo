import '../../models/student.dart';

abstract class StudentService {
  Future<Student> getStudent(int id);
}
