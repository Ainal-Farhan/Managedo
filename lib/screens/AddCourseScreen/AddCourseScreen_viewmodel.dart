import 'package:managedo_mobile_app/app/dependencies.dart';
//import 'package:managedo_mobile_app/models/course.dart';
import 'package:managedo_mobile_app/services/course/course_service.dart';

import '../../app/dependencies.dart';

import '../viewmodel.dart';

class AddCourseScreenViewmodel extends Viewmodel {
  CourseService get courseService => dependency();

  void init() {
    turnBusy();
    turnIdle();
  }
}
