import 'package:tcc/App/Home/Model/reference_person.dart';

abstract class HomeRepository {
  Future<List<ReferencePerson>> listReferencePerson({required String token});
  Future<ReferencePerson> createReferencePerson({required ReferencePerson referencePerson});
}