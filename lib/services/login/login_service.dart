import '../../models/login_credential.dart';

abstract class LoginService {
  Future<List<LoginCredential>> getAllLoginCredentials();
}
