/*
 {
        "_id": "671a747f9e1df020966c3255",
        "fullName": "Becky Bashirian",
        "socialName": "capacitor",
        "motherName": "Johanna O'Hara",
        "nis": "020202022",
        "cpf": "00906366354",
        "diagnosis": "Gigantismo",
        "rg": {
            "issueDate": "2005",
            "issuingBody": "SSP",
            "number": "20055151777",
            "uf": "CE",
            "_id": "671a747f9e1df020966c3256"
        },
        "isShelter": false,
        "localLocalization": "URBAN",
        "cep": "60010102",
        "adress": "Avenida Avenida",
        "neighborhood": "Bairroh",
        "adressComplement": "Complementoh",
        "adressNumber": "Numeroh",
        "city": "West Ike",
        "phone": "491-441-9068",
        "state": "CE",
        "familyPhoto": "671a747d9e1df020966c3248",
        "whoIsOpeningId": "744",
        "fistEntryInUnityId": "671a747e9e1df020966c324e",
        "familyCompositionId": "671a747e9e1df020966c324a",
        "homeConditionsId": "671a747e9e1df020966c3251",
        "workConditionId": "671a747e9e1df020966c3253",
        "birthDate": "2023-12-08T21:54:13.000Z",
        "biologicalGender": "Feminino",
        "observations": [
            {
                "observation": "A primeira observação da pessoa de referência 3",
                "whoIsObservingId": "61",
                "createdAt": "2024-10-24T16:24:55.263Z",
                "updatedAt": "2024-10-24T16:24:55.263Z",
                "_id": "671a74d79e1df020966c325a"
            }
        ],
        "createdAt": "2024-10-24T16:23:27.027Z",
        "updatedAt": "2024-10-24T16:23:27.027Z",
        "__v": 1
    },

*/


import 'package:tcc/App/Home/Model/observations.dart';
import 'package:tcc/App/Home/Model/rg.dart';

class ReferencePerson {
  final String? id;
  final String? fullName;
  final String? socialName;
  final String? motherName;
  final String? nis;
  final String? cpf;
  final String? diagnosis;
  final Rg? rg;
  final bool? isShelter;
  final String? localLocalization;
  final String? cep;
  final String? adress;
  final String? neighborhood;
  final String? adressComplement;
  final String? adressNumber;
  final String? city;
  final String? phone;
  final String? state;
  final String? familyPhotoId;
  final String? whoIsOpeningId;
  final String? fistEntryInUnityId;
  final String? familyCompositionId;
  final String? homeConditionsId;
  final String? workConditionId;
  final String? birthDate;
  final String? biologicalGender;
  final List<Observation> observations;
  

  ReferencePerson({required this.id,required this.fullName,required this.socialName,required this.motherName, required this.nis, required this.cpf, required this.diagnosis, required this.rg, required this.isShelter, required this.localLocalization, required this.cep, required this.adress, required this.neighborhood, required this.adressComplement, required this.adressNumber, required this.city, required this.phone, required this.state, required this.familyPhotoId, required this.whoIsOpeningId, required this.fistEntryInUnityId, required this.familyCompositionId, required this.homeConditionsId,required this.workConditionId, required this.birthDate, required this.biologicalGender, required this.observations});

  factory ReferencePerson.fromJson(Map<String,dynamic> json){
    
    final rg = Rg.fromJson(json['rg']);
    final observationListJson = json['observations'] as List;

    final observationList = observationListJson.map((e)=> Observation.fromJson(e));
    


    return ReferencePerson(
      id: json['_id'], 
      fullName: json['fullName'], 
      socialName: json['socialName'], 
      motherName: json['motherName'], 
      nis: json['nis'], 
      cpf: json['cpf'], 
      diagnosis: json['diagnosis'], 
      rg: rg, 
      isShelter: json['isShelter'], 
      localLocalization: json['localLocalization'], 
      cep: json['cep'], 
      adress: json['adress'], 
      neighborhood: json['neighborhood'], 
      adressComplement: json['adressComplement'], 
      adressNumber: json['adressNumber'], 
      city: json['city'], 
      phone: json['phone'], 
      state: json['state'], 
      familyPhotoId: json['familyPhoto'], 
      whoIsOpeningId: json['whoIsOpeningId'], 
      fistEntryInUnityId: json['fistEntryInUnityId'], 
      familyCompositionId: json['familyCompositionId'], 
      homeConditionsId: json['homeConditionsId'], 
      workConditionId: json['workConditionId'], 
      birthDate: json['birthDate'], 
      biologicalGender: json['biologicalGender'], 
      observations: observationList.toList()
    );
  }

}