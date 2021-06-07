import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../rest_service.dart';
import './user_service.dart';

class UserServiceRest implements UserService {
  final rest = dependency<RestService>();

  @override
  Future<User> getUser(int id) async {
    final userJson = await rest.get('students/$id');

    return User.fromJson(userJson);
  }

  @override
  Future<Map<String, dynamic>> getUserInJson(int id) async {
    return await rest.get('students/$id');
  }
}
