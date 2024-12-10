import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tcc/App/Home/Model/reference_person.dart';
import 'package:tcc/App/Home/Service/home_service.dart';
import 'package:tcc/App/Home/View/especification_page.dart';
import 'package:tcc/App/infra/fakeDb/fakedb.dart';

enum HomePageState{
  idle,
  sucess,
  error
}

enum RadiuValue{
  Masculino,
  Feminino
}

class HomeViewModel extends ChangeNotifier{
  
  final stateList = [
    "Ceará","São Paulo","Rio de Janeiro","Pernambuco"
  ];

  TextEditingController fullNameController = TextEditingController();
  TextEditingController socialNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController nisController = TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  String _stateDropDownValue = "";
  String get stateDropDownValue => _stateDropDownValue;

  RadiuValue _radiuValue = RadiuValue.Masculino;
  RadiuValue get radiuValue => _radiuValue;
  
  HomePageState _state = HomePageState.idle;
  HomePageState get state => _state;

  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  List<ReferencePerson> _referencePersonList = List.empty();
  List<ReferencePerson> get referencePersonList => _referencePersonList;

  final HomeService _service = HomeService();

  void setRadiuValue({required RadiuValue newRadiuValue}){
    _radiuValue = newRadiuValue;
    notifyListeners();
  }

  void setDropDownValue({required String newDropDownValue}){
    _stateDropDownValue = newDropDownValue;
    notifyListeners();
  }

  void setCurrentPageIndex({required int newIndex}){
    _currentPageIndex = newIndex;
    notifyListeners();
  }

  void setHomePageState({required HomePageState state}){
    _state = state;
    notifyListeners();
  }

  void setErrorMessage({required String err}){
    _errorMessage = err;
    notifyListeners();
  }

  setReferencePersonList({required List<ReferencePerson> referencePersonList}){
    _referencePersonList = referencePersonList;
    notifyListeners();
  }

  void goToEspecificationScreen({required int index,required BuildContext ctx,required ReferencePerson referencePerson}){
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (context) => EspecificationPage(index: index,referencePerson: referencePerson))
    );
  }


  

   void resetScreen(){
    _errorMessage = "";
    setHomePageState(state: HomePageState.idle);
  }

  Future<void> createReferencePerson() async {
    try{
      final _ = _service.createReferencePerson(fullName: fullNameController.text,
      socialName: socialNameController.text,
      motherName: socialNameController.text,
      cpf: cpfController.text,
      nis: nisController.text,
      diagnosis: diagnosisController.text,
      rgNumber: "00000",
      rgUf: "rgUf",
      rgIssue: "rgIssue",
      rgDateIssue: "rgDateIssue",
      isShelter: false,
      localLocalization: "localLocalization",
      cep: "cep",
      adress: "adress",
      adressNumber: "adressNumber",
      adressComoplement: "adressComoplement",
      state: stateDropDownValue,
      city: "city",
      phone: "phone",
      whoIsObservingId: "whoIsObservingId",
      biologicalGender: radiuValue.name,
      birthDate: "birthDate"
      );
      setHomePageState(state: HomePageState.sucess);
    }catch(err){
      final error = err as DioException;
      if(error.message == null) setErrorMessage(err: "Error desconhecido");
      setErrorMessage(err: error.message!);
      setHomePageState(state: HomePageState.error);
    }
  }

  Future<void> getReferencePersonList() async {
    try{
      final List<ReferencePerson> referencePersonList = await _service.listReferencePerson(token: token);
      setReferencePersonList(referencePersonList: referencePersonList);
      setHomePageState(state: HomePageState.sucess);
    }catch(err){
      final error = err as DioException;
      if(error.message == null) setErrorMessage(err: "Error desconhecido");
      setErrorMessage(err: error.message!);
      setHomePageState(state: HomePageState.error);
    }
  }

}