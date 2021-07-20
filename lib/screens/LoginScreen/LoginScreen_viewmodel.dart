import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/login_credential.dart';
import 'package:managedo_mobile_app/models/user.dart';
import 'package:managedo_mobile_app/services/login/login_service.dart';
import 'package:managedo_mobile_app/services/user/user_service.dart';

import '../../app/dependencies.dart';

import '../viewmodel.dart';

class LoginScreenViewmodel extends Viewmodel {
  LoginService get loginService => dependency();
  UserService get userService => dependency();

  void init() {
    turnBusy();
    turnIdle();
  }

  Future<User> validate({String username, String password}) async {
    print('username: $username');
    print('password: $password');

    if (username == '' || password == '') return null;

    LoginCredential loginCredential =
        await loginService.getAllLoginCredentials().then((loginList) async {
      if (loginList == null) return null;

      for (int i = 0; i < loginList.length; i++) {
        print(loginList[i].username);
        print(loginList[i].password);
        print(loginList[i].fkUserId);

        if (loginList[i].username == username &&
            loginList[i].password == password) {
          return loginList[i];
        }
      }
      return null;
    });

    return await userService.getUser(loginCredential.fkUserId);
  }
}
