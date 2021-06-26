import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/relation.dart';
import 'package:managedo_mobile_app/services/rest_service.dart';
import 'package:managedo_mobile_app/services/studentRelation/studentRelation_service.dart';

class StudentRelationServiceRest implements StudentRelationService {
  static const baseEndpoint = "relations";

  final rest = dependency<RestService>();

  @override
  Future<List<StudentRelations>> getListOfStudentRelationsBasedOnParentId(
      int parentId) async {
    final listItemJson = await rest
        .get('$baseEndpoint/fkParentId/$parentId')
        .catchError((error) => null);

    return listItemJson != null
        ? (listItemJson as List)
            .map((itemJson) => StudentRelations.fromJson(itemJson))
            .toList()
        : null;
  }
}
