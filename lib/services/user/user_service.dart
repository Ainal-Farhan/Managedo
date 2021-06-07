import '../../models/user.dart';

abstract class UserService {
  Future<User> getUser(int id);

  Future<Map<String,dynamic>> getUserInJson(int id);
}
