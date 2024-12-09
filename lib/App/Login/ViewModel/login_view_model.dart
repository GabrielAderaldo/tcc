import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tcc/App/Home/home_page.dart';
import 'package:tcc/App/Login/Service/login_service.dart';


enum LoginPageState{
  idle,
  sucess,
  error
}

class LoginViewModel extends ChangeNotifier{
  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();

  LoginPageState _state = LoginPageState.idle;
  LoginPageState get state => _state;

  String get error => _error;
  String _error = "";

  final loginService = LoginService();
  

  setLoginPageState({required LoginPageState state}){
    _state = state;
    notifyListeners();
  }

  setError({String? err}){
    if(err == null) _error = "ERRO DESCONHECIDO";
    _error = err!;
    notifyListeners();
  }

  void resetScreen(){
    _error = "";
    setLoginPageState(state: LoginPageState.idle);
  }

  void goToHome({required BuildContext ctx}){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (BuildContext context)=> HomePage()));
  }

  void login() async {
    try{
      final user = await loginService.login(login: loginController.text, pass: passController.text);
      setLoginPageState(state: LoginPageState.sucess);     
    }catch(err){
      final dioError = err as DioException;
      setError(err: dioError.message);
      setLoginPageState(state: LoginPageState.error);
    }
  }
}