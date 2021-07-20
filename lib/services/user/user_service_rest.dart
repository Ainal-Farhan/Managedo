import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../rest_service.dart';
import './user_service.dart';

class UserServiceRest implements UserService {
  final rest = dependency<RestService>();

  @override
  Future<User> getUser(int id) async {
    return await rest.get('users/$id').then((json) => User.fromJson(json));
  }

  @override
  Future<Map<String, dynamic>> getUserInJson(int id) async {
    return await rest.get('users/$id');
  }
}
