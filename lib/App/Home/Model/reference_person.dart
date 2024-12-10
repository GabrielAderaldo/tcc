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