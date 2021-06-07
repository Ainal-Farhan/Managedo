import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/course.dart';
import 'package:managedo_mobile_app/services/course/course_service.dart';
import 'package:managedo_mobile_app/services/rest_service.dart';

class CourseServiceRest implements CourseService {
  static const baseEndpoint = "courses";

  final rest = dependency<RestService>();

  @override
  Future<List<Course>> getCourseListBasedOnSemesterId(int semesterId) async {
    final jsonList = await rest
        .get('$baseEndpoint/fkSemesterId/$semesterId')
        .catchError((err) {
      return null;
    });

    return jsonList != null
        ? (jsonList as List)
            .map((itemJson) => Course.fromJson(itemJson))
            .toList()
        : null;
  }
}
