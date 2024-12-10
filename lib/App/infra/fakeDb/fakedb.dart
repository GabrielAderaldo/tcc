import 'package:tcc/App/Home/Model/reference_person.dart';
import 'package:tcc/App/Login/Model/user.dart';

String token = "";

User userUsed = User(id: 0, fullName: "fullName", email: "email", crm: "crm", role: "role", isActive: false);

List<ReferencePerson> referencePersonData = List.empty();

List<String?> listOfDiagnosis = List.empty();
List<String?> listOfCity = List.empty();
List<bool?> listOfIsShelter = List.empty();
List<String?> listOfState = List.empty();