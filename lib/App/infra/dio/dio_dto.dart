import 'package:dio/dio.dart';
import 'package:tcc/App/infra/fakeDb/fakedb.dart';

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


Future<Map<String,dynamic>> dioCreateReferencePerson({required String fullName,
required String socialName,
required String motherName,
required String cpf,
required String nis,
required String diagnosis,
required String rgNumber,
required String rgUf,
required String rgIssue,
required String rgDateIssue,
required bool isShelter,
required String localLocalization,
required String cep,
required String adress,
required String neighborhood,
required String adressNumber,
required String adressComoplement,
required String state,
required String city,
required String phone,
required String whoIsObservingId,
required String biologicalGender,
required String birthDate}) async {
  try{
  dio.options.headers['content-Type'] = 'application/json';
  dio.options.headers['Authorization'] = 'Bearer $token';
  final Response dioCreateReferencePersonResponse = await dio.post('https://conecta-social.onrender.com/api/create/reference/person',
  data: {
    "fullName":fullName,
    "socialName":socialName,
    "motherName":motherName,
    "cpf":cpf,
    "nis":nis,
    "diagnosis":diagnosis,
    "rgNumber":rgNumber,
    "rgUf":"CE",
    "rgIssue":"SSP",
    "rgDateIssue":"2005",
    "isShelter":"false",
    "localLocalization":"URBAN",
    "cep":"60010102",
    "adress":"Avenida Avenida",
    "neighborhood":"Bairroh",
    "adressNumber":"Numeroh",
    "adressComplement":"Complementoh",
    "state":"Ceara",
    "city":"sdsdsd",
    "phone":"aaaaa",
    "whoIsObservingId":"sdsdsdsd",
    "biologicalGender":biologicalGender.toString(),
    "birthDate":"03/11/1998"
});
  

  return dioCreateReferencePersonResponse.data;
  }catch(err){
    print(err);
    rethrow;
  }
  
}

