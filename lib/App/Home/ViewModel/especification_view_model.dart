import 'package:flutter/material.dart';
import 'package:tcc/App/Home/View/data_page.dart';
import 'package:tcc/App/infra/fakeDb/fakedb.dart';

class EspecificationViewModel extends ChangeNotifier{


  void goToDataPage({required BuildContext ctx}){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => DataPage()));
  } 


  Map<T, int> contarItens<T>(List<T?> lista) {
  // Cria um mapa vazio para armazenar os resultados
  Map<T, int> mapa = {};

  // Itera sobre cada item da lista
  for (T? item in lista) {
    if (item != null) { // Ignora elementos nulos
      // Se o item já existe no mapa, incrementa o valor
      if (mapa.containsKey(item)) {
        mapa[item] = mapa[item]! + 1;
      } else {
        // Caso contrário, inicializa o item com valor 1
        mapa[item] = 1;
      }
    }
  }

  // Retorna o mapa preenchido
  return mapa;
}
  
  void initDate(){
    final _listOfDiagnosis = referencePersonData.map((e)=> e.diagnosis).toList();
    final _listOfCity = referencePersonData.map((e)=> e.city).toList();
    final _listOfIsShelter = referencePersonData.map((e)=> e.isShelter).toList();
    final _listOfState = referencePersonData.map((e)=> e.state).toList();

    listOfDiagnosis = _listOfDiagnosis;
    listOfCity = _listOfCity;
    listOfIsShelter = _listOfIsShelter;
    listOfState = _listOfState;

  }
}