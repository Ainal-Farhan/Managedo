import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/semester.dart';
import 'package:managedo_mobile_app/services/rest_service.dart';

import './semester_service.dart';

class SemesterServiceRest implements SemesterService {
  static const baseEndpoint = "semesters";

  final rest = dependency<RestService>();

  @override
  Future<List<Semester>> getAllSemesters() async {
    final jsonList = await rest.get(baseEndpoint);

    return (jsonList as List)
        .map((jsonItem) => Semester.fromJson(jsonItem))
        .toList();
  }

  @override
  Future<List<Semester>> getAllSemesterBasedOnEducationId(
      int educationId) async {
    final jsonList = await rest.get('$baseEndpoint/fkEducationId/$educationId');
    return (jsonList as List)
        .map((jsonItem) => Semester.fromJson(jsonItem))
        .toList();
  }

  @override
  Future<Semester> getSemesterBasedOnId(int semesterId) async {
    final itemJson = await rest.get('$baseEndpoint/$semesterId');

    return Semester.fromJson(itemJson);
  }

  @override
  Future<Semester> updateSemester(Semester updatedSemester) async {
    return await rest
        .put('$baseEndpoint/${updatedSemester.id}',
            data: updatedSemester.toJson())
        .then((res) => updatedSemester)
        .catchError((err) => null);
  }

  @override
  Future<bool> deleteSemester(int semesterId) async {
    return await rest
        .delete('$baseEndpoint/$semesterId')
        .then((res) => true)
        .catchError((err) => false);
  }
}
