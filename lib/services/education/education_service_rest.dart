import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/education.dart';
import 'package:managedo_mobile_app/services/education/education_service.dart';
import 'package:managedo_mobile_app/services/rest_service.dart';

class EducationServiceRest implements EducationService {
  static const baseEndpoint = "educations";

  final rest = dependency<RestService>();

  @override
  Future<Education> getEducation(int id) async {
    final educationJson = await rest.get('$baseEndpoint/$id');

    return Education.fromJson(educationJson);
  }

  @override
  Future<List<Education>> getEducationListBasedOnStudentId(
      int studentId) async {
    final educationJson = await rest.get('$baseEndpoint?studentId=$studentId');

    return (educationJson as List)
        .map((education) => Education.fromJson(education))
        .toList();
  }

  @override
  Future<List<Education>> getEducationList() async {
    final educationJson = await rest.get('$baseEndpoint');

    return (educationJson as List)
        .map((education) => Education.fromJson(education))
        .toList();
  }

  @override
  Future<bool> deleteSelectedEducation(int educationId) async {
    final bool isDeleted = await rest
        .delete('$baseEndpoint/$educationId')
        .then((value) => true)
        .catchError((err) => false);

    return isDeleted;
  }
}
