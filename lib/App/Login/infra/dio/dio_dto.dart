import 'package:dio/dio.dart';


final Dio dio = Dio();

Future<Map<String,dynamic>> dioLogin({required String login,required String pass}) async {
  final Response loginResponse = await dio.post('https://api-ponto-v2.onrender.com/api/auth/login', data: {
    'email':login,
    'pass':pass
  });
  return loginResponse.data;
}

