import 'package:managedo_mobile_app/models/relation.dart';

abstract class StudentRelationService {
  Future<List<StudentRelations>> getListOfStudentRelationsBasedOnParentId(int parentId);
}