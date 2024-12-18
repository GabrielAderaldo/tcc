
import 'package:tcc/App/Login/Model/user.dart';
import 'package:tcc/App/Login/Repository/login_repository.dart';
import 'package:tcc/App/infra/dio/dio_dto.dart';
import 'package:tcc/App/infra/fakeDb/fakedb.dart';

class LoginService implements LoginRepository{
  @override
  Future<User> login({required String login,required String pass}) async {
    try{
      final Map<String,dynamic> responseMap = await dioLogin(login: login, pass: pass);
      final user = User.fromJson(responseMap['user']);
      final _token = responseMap['token'];
      userUsed = user;
      token = _token;
      return user;
    }catch(err){
      rethrow;
    }    
  }

  @override
  void logout() {
    // TODO: implement logout
  }
 
 
}