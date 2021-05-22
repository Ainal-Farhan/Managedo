import 'package:flutter/cupertino.dart';

import '../../app/dependencies.dart';
import '../../models/student.dart';
import '../rest_service.dart';
import './student_service.dart';

class StudentServiceRest implements StudentService {
  final rest = dependency<RestService>();

  @override
  Future<List<Student>> getStudentList() async {
    final listJson = await rest.get('students');
    return (listJson as List)
        .map((itemJson) => Student.fromJson(itemJson))
        .toList();
  }
}
