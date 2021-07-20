import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/user.dart';
import 'package:managedo_mobile_app/services/user/user_service.dart';

import '../viewmodel.dart';

class StudentHomeViewmodel extends Viewmodel {
  UserService get userService => dependency();
  User student;

  init({int studentId}) async {
    turnBusy();
    this.student = await userService
        .getUserBasedOnFkStudentId(studentId)
        .catchError((onError) => null);
    turnIdle();
  }
}
