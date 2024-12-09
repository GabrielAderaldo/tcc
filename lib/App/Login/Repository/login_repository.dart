import 'package:tcc/App/Login/Model/user.dart';

abstract class LoginRepository {
  Future<User> login({required String login,required String pass});
  void logout();
}