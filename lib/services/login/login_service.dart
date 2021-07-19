import '../../models/login_credential.dart';

abstract class LoginService {
  Future<LoginCredential> getLoginId(int id);
  Future<LoginCredential> getLoginUsername(String username);
  Future<LoginCredential> getLoginPassword(String password);

  Future<Map<String, dynamic>> getLoginIdInJson(int id);
  Future<Map<String, dynamic>> getLoginUsernameInJson(String username);
  Future<Map<String, dynamic>> getLoginPasswordInJson(String password);
}
