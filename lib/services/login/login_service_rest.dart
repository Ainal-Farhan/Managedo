import '../../app/dependencies.dart';
import '../../models/login_credential.dart';
import '../rest_service.dart';
import './login_service.dart';

class LoginServiceRest implements LoginService {
  static const baseEndpoint = "login";

  final rest = dependency<RestService>();

  @override
  Future<LoginCredential> getLoginId(int id) async {
    final idJson = await rest.get('id/$id');

    return LoginCredential.fromJson(idJson);
  }

  @override
  Future<LoginCredential> getLoginUsername(String username) async {
    final usernameJson = await rest.get('username/$username');

    return LoginCredential.fromJson(usernameJson);
  }

  @override
  Future<LoginCredential> getLoginPassword(String password) async {
    final passwordJson = await rest.get('password/$password');

    return LoginCredential.fromJson(passwordJson);
  }

  @override
  Future<Map<String, dynamic>> getLoginIdInJson(int id) async {
    return await rest.get('students/$id');
  }

  @override
  Future<Map<String, dynamic>> getLoginUsernameInJson(String username) async {
    return await rest.get('username/$username');
  }

  @override
  Future<Map<String, dynamic>> getLoginPasswordInJson(String password) async {
    return await rest.get('password/$password');
  }
}
