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

class HomeViewModel extends ChangeNotifier{

  HomePageState _state = HomePageState.idle;
  HomePageState get state => _state;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  List<ReferencePerson> _referencePersonList = List.empty();
  List<ReferencePerson> get referencePersonList => _referencePersonList;

  final HomeService _service = HomeService();

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

  void goToEspecificationScreen({required int index,required BuildContext ctx}){
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (context) => EspecificationPage(index: index))
    );
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