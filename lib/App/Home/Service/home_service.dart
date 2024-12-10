import 'package:tcc/App/Home/Model/reference_person.dart';
import 'package:tcc/App/Home/Repository/home_repository.dart';
import 'package:tcc/App/infra/dio/dio_dto.dart';
import 'package:tcc/App/infra/fakeDb/fakedb.dart';

class HomeService implements HomeRepository{
  @override
  Future<bool> createReferencePerson({required String fullName,required String socialName, required String motherName,required String cpf,required String nis, required String diagnosis,required String rgNumber, required String rgUf,required String rgIssue, required String rgDateIssue, required bool isShelter, required String localLocalization, required String cep, required String adress, required String adressNumber, required String adressComoplement, required String state, required String city, required String phone, required String whoIsObservingId, required String biologicalGender, required String birthDate}) async {
    try{
      final responseMap = await dioCreateReferencePerson(fullName: fullName, socialName: socialName, motherName: motherName, cpf: cpf, nis: nis, diagnosis: diagnosis, rgNumber: rgNumber, rgUf: rgUf, rgIssue: rgIssue, rgDateIssue: rgDateIssue, isShelter: isShelter, localLocalization: localLocalization, cep: cep, adress: adress, neighborhood: "neighborhood", adressNumber: adressNumber, adressComoplement: adressComoplement, state: state, city: city, phone: phone, whoIsObservingId: whoIsObservingId, biologicalGender: biologicalGender, birthDate: birthDate);
      return true;
    }catch(err){
      rethrow;
    }
  }

  @override
  Future<List<ReferencePerson>> listReferencePerson({required String token}) async {
    try{
      final listReferencePersonJson = await dioListReferencePerson(token: token);
      final listRefencePerson = listReferencePersonJson.map((e)=> ReferencePerson.fromJson(e));
      referencePersonData = listRefencePerson.toList();
      return listRefencePerson.toList();
    }catch(err){
      rethrow;
    }
  }

}