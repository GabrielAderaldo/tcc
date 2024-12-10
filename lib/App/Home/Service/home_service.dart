import 'package:tcc/App/Home/Model/reference_person.dart';
import 'package:tcc/App/Home/Repository/home_repository.dart';
import 'package:tcc/App/infra/dio/dio_dto.dart';

class HomeService implements HomeRepository{
  @override
  Future<ReferencePerson> createReferencePerson({required ReferencePerson referencePerson}) async {
   

    throw UnimplementedError();
  }

  @override
  Future<List<ReferencePerson>> listReferencePerson({required String token}) async {
    try{
      final listReferencePersonJson = await dioListReferencePerson(token: token);
      final listRefencePerson = listReferencePersonJson.map((e)=> ReferencePerson.fromJson(e));
      return listRefencePerson.toList();
    }catch(err){
      rethrow;
    }
  }

}