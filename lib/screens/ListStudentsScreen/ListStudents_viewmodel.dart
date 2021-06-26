import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/relation.dart';
import 'package:managedo_mobile_app/models/student.dart';
import 'package:managedo_mobile_app/services/student/student_service.dart';
import 'package:managedo_mobile_app/services/studentRelation/studentRelation_service.dart';

import '../viewmodel.dart';

class ListStudentsViewmodel extends Viewmodel {
  StudentRelationService get _studentRelationService => dependency();
  StudentService get _studentService => dependency();

  List<StudentRelations> studentRelations;
  List<Student> students = [];

  Future<void> init({parentId}) async {
    turnBusy();

    students = [];

    studentRelations = await _studentRelationService
        .getListOfStudentRelationsBasedOnParentId(parentId);

    if (studentRelations == null) return;

    await Future.wait(studentRelations.map((studentRelation) async {
      await _studentService
          .getStudent(studentRelation.fkStudentId)
          .then((student) {
        students.add(student);
      });
    }));

    turnIdle();
  }
}
