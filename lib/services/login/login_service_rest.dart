import '../../app/dependencies.dart';
import '../../models/login_credential.dart';
import '../rest_service.dart';
import './login_service.dart';

class LoginServiceRest implements LoginService {
  static const baseEndpoint = "loginCredentials";

  final rest = dependency<RestService>();

  @override
  Future<List<LoginCredential>> getAllLoginCredentials() async {
    final listJson =
        await rest.get(baseEndpoint).then((data) => data).catchError((onError) {
      print(onError.toString());
      return null;
    });

    if (listJson == null) return null;

    return (listJson as List)
        .map((json) => LoginCredential.fromJson(json))
        .toList();
  }
}
