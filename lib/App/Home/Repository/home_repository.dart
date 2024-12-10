import 'package:tcc/App/Home/Model/reference_person.dart';

abstract class HomeRepository {
  Future<List<ReferencePerson>> listReferencePerson({required String token});
  Future<bool> createReferencePerson({required String fullName,required String socialName, required String motherName,required String cpf,required String nis, required String diagnosis,required String rgNumber, required String rgUf,required String rgIssue, required String rgDateIssue, required bool isShelter, required String localLocalization, required String cep, required String adress, required String adressNumber, required String adressComoplement, required String state, required String city, required String phone, required String whoIsObservingId, required String biologicalGender, required String birthDate});
}