import 'package:managedo_mobile_app/app/dependencies.dart';
import 'package:managedo_mobile_app/models/login_credential.dart';
import 'package:managedo_mobile_app/services/login/login_service.dart';

import '../../app/dependencies.dart';

import '../viewmodel.dart';

class LoginScreenViewmodel extends Viewmodel {
  List<LoginCredential> login;
  static LoginService get getLoginId => dependency();
  static LoginService get getLoginUsername => dependency();
  static LoginService get getLoginPassword => dependency();
}
