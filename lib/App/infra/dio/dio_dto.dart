import 'package:dio/dio.dart';
import 'package:tcc/App/Home/Model/reference_person.dart';


final Dio dio = Dio();

Future<Map<String,dynamic>> dioLogin({required String login,required String pass}) async {
  final Response loginResponse = await dio.post('https://conecta-social.onrender.com/api/auth/login', data: {
    'email':login,
    'pass':pass
  });
  return loginResponse.data;
}

Future<List<dynamic>> dioListReferencePerson({required String token}) async {
  dio.options.headers['content-Type'] = 'application/json';
  dio.options.headers['Authorization'] = 'Bearer $token';
  final Response dioListReferencePersonResponse = await dio.get('https://conecta-social.onrender.com/api/list/reference/person');
  
  return dioListReferencePersonResponse.data;
}

