import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/user.dart';
import 'package:managedo_mobile_app/services/user/user_service.dart';

import '../viewmodel.dart';

class ParentHomeViewmodel extends Viewmodel {
  UserService get userService => dependency();
  User parent;

  init({int parentId}) async {
    turnBusy();
    parent = await userService
        .getUserBasedOnFkParentId(parentId)
        .catchError((onError) => null);
    turnIdle();
  }
}
